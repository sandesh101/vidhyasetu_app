import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vidhyasetu_app/features/auth/data/repositories/auth_repository.dart';

class AuthProvider extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final AuthRepository _authRepository;
  AuthProvider(super.state, this._authRepository);

  //Login provider
  Future<void> login(String email, String password) async {
    state = AsyncValue.loading();
    try {
      final response = await _authRepository.login(email, password);
      // return response;
      state = AsyncValue.data(response);
    } catch (e, stack) {
      // rethrow;
      state = AsyncValue.error(e.toString(), stack);
    }
  }
}
