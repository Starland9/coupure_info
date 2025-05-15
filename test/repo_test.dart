import 'package:coupure_info/src/logic/cubits/cubit/locality_cubit.dart';
import 'package:coupure_info/src/logic/repo/localities_repo.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

void main() {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://eneo-scrapper.onrender.com/'),
  );

  final localityRepo = LocalitiesRepo(dio);

  group(LocalityCubit, () {
    late LocalityCubit cubit;

    setUp(() {
      cubit = LocalityCubit(localityRepo);
    });

    test('getRegions', () async {
      await cubit.getRegions();
      expect(cubit.state, isA<LocalityRegionsLoaded>());
    });

    test('getLocalities', () async {
      await cubit.getLocalities(region: 'region', locality: 'locality');
      expect(cubit.state, isA<LocalityLoaded>());
    });
  });
}
