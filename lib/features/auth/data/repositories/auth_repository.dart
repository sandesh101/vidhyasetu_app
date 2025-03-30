import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vidhyasetu_app/features/auth/data/auth_api.dart';
import 'package:vidhyasetu_app/features/auth/data/models/user_model.dart';

class AuthRepository {
  final AuthApi _authApi;

  AuthRepository(this._authApi);

  //Login repository
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _authApi.login(email, password);
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  //Register repository
  Future<UserModel> register(String name, String email, String password) async {
    try {
      final response = await _authApi.signup(name, email, password);
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }

    //Logout repository

    //Forgot password repository
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authApi = ref.watch(authApiProvider);
  return AuthRepository(authApi);
});
