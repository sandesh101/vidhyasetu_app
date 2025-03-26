import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vidhyasetu_app/core/config/app_constant.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstant.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {"Accept": "application/json"},
    ),
  );

  ApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // print("Requesting: ${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // print("Response: ${response.statusCode}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // print("Error: ${e.message}");
          return handler.next(e);
        },
      ),
    );
  }
}

final dioProvider = Provider<Dio>((ref) {
  return ApiService()._dio;
});
