import 'package:auto_route/annotations.dart';
import 'package:coupure_info/src/logic/cubits/cubit/locality_cubit.dart';
import 'package:coupure_info/src/logic/repo/localities_repo.dart';
import 'package:coupure_info/src/screens/home/components/locality_item.dart';
import 'package:coupure_info/src/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LocalityCubit(
            context.read<LocalitiesRepo>(),
          )..getLocalities(locality: "douala"), // Charger les données initiales
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('Coupure Info'),
                pinned: true,
                floating: true,
                elevation: 0,
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                bottom: AppBar(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  foregroundColor: AppColors.onPrimary,
                  title: _buildSearchField(context),
                  automaticallyImplyLeading:
                      false, // Remove the back button on the search AppBar
                ),
                // Make the search bar part of the bottom section.
              ),
            ];
          },
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return BlocBuilder<LocalityCubit, LocalityState>(
      builder: (context, state) {
        return TextField(
          style: const TextStyle(color: AppColors.onPrimary),
          controller: _searchController,
          keyboardType: TextInputType.webSearch,
          decoration: InputDecoration(
            iconColor: AppColors.onPrimary,
            prefixIconColor: AppColors.onPrimary,
            suffixIconColor: AppColors.onPrimary,
            hintText: 'Rechercher une localité...',
            hintStyle: const TextStyle(color: AppColors.onPrimary),
            filled: true,
            fillColor: AppColors.primary,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),

            prefixIcon: Icon(MdiIcons.mapSearch),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
              },
            ),
            border: InputBorder.none, // Remove the border
          ),

          onSubmitted: (value) {
            setState(() {
              _searchQuery = value;
            });
            // Trigger search/filter here
            context.read<LocalityCubit>().getLocalities(
              locality: value,
            ); // Pass the search query to the cubit.
          },
        );
      },
    );
  }

  Widget _buildBody() {
    return Center(
      child: BlocBuilder<LocalityCubit, LocalityState>(
        builder: (context, state) {
          if (state is LocalityError) {
            return Text(state.message);
          }

          if (state is LocalityLoaded) {
            final localities = state.localities;
            if (localities.isEmpty && _searchQuery.isEmpty) {
              return const Text('Aucune localité trouvée');
            }
            if (localities.isEmpty && _searchQuery.isNotEmpty) {
              return const Text(
                'Aucune localité trouvée pour cette recherche.',
              );
            }
            return ListView.builder(
              itemCount: localities.length,
              itemBuilder:
                  (context, index) => LocalityItem(
                    locality: localities[index],
                    key: Key(index.toString()),
                  ),
            );
          }
          if (state is LocalityLoading) {
            return const CircularProgressIndicator.adaptive(); // Show loading indicator
          }

          return const CircularProgressIndicator.adaptive(); //show indicator,
        },
      ),
    );
  }
}
