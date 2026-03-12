import 'package:api/core/network/api_consumer.dart';
import 'package:dio/dio.dart';

class ApiService implements ApiConsumer {
  final Dio dio;

  ApiService({required this.dio});
  @override
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.get(
      path,
      options: Options(
        headers:
            queryParameters ??
            {'Accept': 'application/json', 'Authorization': 'Bearer '},
      ),
    );
    return response.data;
  }

  @override
  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) {
    return dio.post(
      path,
      options: Options(
        headers: queryParameters ?? {'Accept': 'application/json'},
      ),
      data: body,
    );
  }
}
