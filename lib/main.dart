import 'package:coupure_info/src/app.dart';
import 'package:coupure_info/src/logic/repo/localities_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://eneo-scrapper.onrender.com/'),
  );

  runApp(
    RepositoryProvider(
      create: (context) => LocalitiesRepo(dio),
      child: CoupureInfoApp(),
    ),
  );
}
