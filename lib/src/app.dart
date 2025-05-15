import 'package:coupure_info/src/core/routing/app_route.dart';
import 'package:coupure_info/src/shared/constants/app_colors.dart';
import 'package:coupure_info/src/shared/constants/app_strings.dart';
import 'package:flutter/material.dart';

class CoupureInfoApp extends StatelessWidget {
  final _appRouter = AppRouter();

  CoupureInfoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          secondary: AppColors.secondary,
          onPrimary: AppColors.onPrimary,
          onSecondary: AppColors.onSecondary,
        ),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
