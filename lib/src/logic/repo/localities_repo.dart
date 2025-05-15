import 'package:coupure_info/src/logic/models/locality.dart';
import 'package:dio/dio.dart';

class LocalitiesRepo {
  final Dio _dio;

  LocalitiesRepo(this._dio);

  Future<List<String>> getRegions() async {
    final response = await _dio.get('/regions');
    return (response.data['regions'] as List).toList().cast<String>();
  }

  Future<List<Locality>> getLocalities({
    String? region,
    required String locality,
  }) async {
    final response = await _dio.get(
      '/locality/$locality',
      queryParameters: {'region': region},
    );
    return (response.data['localities'] as List)
        .map((e) => Locality.fromJson(e))
        .toList();
  }
}
