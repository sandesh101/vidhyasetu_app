import 'package:vidhyasetu_app/features/auth/data/auth_api.dart';

class AuthRepository {
  final AuthApi _authApi;

  AuthRepository(this._authApi);

  //Login repository
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _authApi.login(email, password);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //Register repository

  //Logout repository

  //Forgot password repository
}
