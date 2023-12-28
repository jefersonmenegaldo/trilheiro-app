import 'package:trilheiro/src/models/user.model.dart';
import 'package:flutter/foundation.dart';

class UserState with ChangeNotifier, DiagnosticableTreeMixin  {
  User? _user;

  User? get user => _user;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}
