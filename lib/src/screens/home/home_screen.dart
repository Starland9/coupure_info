import 'package:auto_route/annotations.dart';
import 'package:coupure_info/src/logic/cubits/cubit/locality_cubit.dart';
import 'package:coupure_info/src/logic/repo/localities_repo.dart';
import 'package:coupure_info/src/screens/home/components/locality_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              LocalityCubit(context.read<LocalitiesRepo>())
                ..getLocalities(locality: "douala"),
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Coupure Info'),
        ),
        child: Center(
          child: BlocBuilder<LocalityCubit, LocalityState>(
            builder: (context, state) {
              if (state is LocalityError) {
                return Text(state.message);
              }

              if (state is LocalityLoaded) {
                final localities = state.localities;
                if (localities.isEmpty) {
                  return const Text('Aucune localité trouvée');
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

              return const CupertinoActivityIndicator();
            },
          ),
        ),
      ),
    );
  }
}
