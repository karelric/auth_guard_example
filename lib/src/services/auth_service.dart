import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auth_guard/src/models/user.dart';
import 'package:auth_guard/src/utils/http_errors.dart';
import 'package:auth_guard/src/services/api_service.dart';

class AuthService extends ValueNotifier<User> {
  final ApiService _apiSrv;

  AuthService(this._apiSrv) : super(null) {
    _apiSrv.onError.listen((error) {
      if (error is UnauthorizedError) {
        value = null;
      }
    });
  }

  User get currentUser => value;

  Future<void> signIn(String email, String password) async {
    /// only for test purpose
    value = User(email: email);
  }
}
