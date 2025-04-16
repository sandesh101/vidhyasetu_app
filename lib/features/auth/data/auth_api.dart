import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vidhyasetu_app/core/services/api_service.dart';

class AuthApi {
  final Dio _dio;

  AuthApi(this._dio);

  //Login function
  Future<Response> login(String email, String password) async {
    return await _dio
        .post('/auth/login', data: {'email': email, 'password': password})
        .catchError((e) {
          throw Exception(e.response?.data["message"] ?? 'Unknown error');
        });
  }

  //Register function
  Future<Response> signup(String name, String email, String password) async {
    return await _dio
        .post(
          '/auth/register',
          data: {'fullName': name, 'email': email, 'password': password},
        )
        .catchError((e) {
          throw Exception(e.response?.data["message"]);
        });
  }

  //Logout function

  //Forgot password function
}

final authApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthApi(dio);
});
