import 'package:amazon_frontend/core/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = const User(
      id: '',
      name: '',
      email: '',
      password: '',
      type: '',
      token: '',
      address: '');

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
