import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trilheiro/src/models/user.model.dart';
import 'package:trilheiro/src/shared/state/user_state.dart';

import '../exceptions/custom.exception.dart';
import '../repositories/user.repository.dart';

import 'package:provider/provider.dart';

class UserService {
  final UserRepository _userRepository;
  final BuildContext context;

  UserService(this._userRepository, this.context);

  Future<User?> getUser() async {
    try {
      final user = await _userRepository.get();
      return user;
    } on CustomException catch (e) {
      // Tratar a exceção aqui ou relançá-la se necessário
      if (kDebugMode) {
        print("Erro personalizado: $e");
      }
      rethrow; // Re-lança a exceção para que o caller possa tratá-la
    } catch (e) {
      // Tratar outras exceções aqui, se necessário
      if (kDebugMode) {
        print("Erro não tratado: $e");
      }
      throw CustomException(
          "Erro inesperado"); // Lança uma exceção personalizada
    }
  }

  Future<bool> userLogin(User userData) async {
    try {
      final user = await _userRepository.login(userData);
      if (user != null) {
        if (user.id == 4) {
          user.id = null;
        }
        await saveUser(user);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future saveUser(User user) async {
    final userState = Provider.of<UserState>(context, listen: false);
    userState.setUser(user);
  }
}
