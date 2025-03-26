import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vidhyasetu_app/core/services/api_service.dart';
import 'package:vidhyasetu_app/features/auth/data/models/user_model.dart';

class AuthApi {
  final Dio _dio;

  AuthApi(this._dio);

  //Login function
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      return UserModel.fromJson(e.response!.data);
    }
  }

  //Register function
  Future<Response> signup(String name, String email, String password) async {
    return _dio.post(
      '/auth/register',
      data: {'fullName': name, 'email': email, 'password': password},
    );
  }

  //Logout function

  //Forgot password function
}

final authApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthApi(dio);
});
