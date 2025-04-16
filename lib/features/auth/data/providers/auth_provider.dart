import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vidhyasetu_app/features/auth/data/models/user_model.dart';
import 'package:vidhyasetu_app/features/auth/data/repositories/auth_repository.dart';

class AuthNotifier extends AsyncNotifier<UserModel?> {
  @override
  Future<UserModel?> build() async {
    return null;
  }

  // Login function
  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await ref
          .read(authRepositoryProvider)
          .login(email, password);
      if (user.statusCode == 200) {
        state = AsyncValue.data(user);
      } else {
        state = AsyncError("Invalid credentials", StackTrace.current);
      }
    } catch (e, stackTrace) {
      log(e.toString());
      state = AsyncError(e.toString(), stackTrace);
    }
  }

  // User registration function
  Future<void> register(String name, String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await ref
          .read(authRepositoryProvider)
          .register(name, email, password);
      if (user.statusCode == 200) {
        state = AsyncValue.data(user);
      } else {
        state = AsyncError(user.message.toString(), StackTrace.current);
      }
    } catch (e, stackTrace) {
      state = AsyncError(e.toString(), stackTrace);
    }
  }

  // Logout function
  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      //Logout
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, UserModel?>(() {
  return AuthNotifier();
});
