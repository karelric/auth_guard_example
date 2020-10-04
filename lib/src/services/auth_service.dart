import 'dart:async';

import 'package:auth_guard/src/models/user.dart';
import 'package:auth_guard/src/services/api_service.dart';
import 'package:auth_guard/src/utils/http_errors.dart';
import 'package:flutter/material.dart';

class AuthService extends ValueNotifier<User> {
  final ApiService _apiSrv;

  AuthService(this._apiSrv) : super(null) {
    _apiSrv.onError.listen((error) {
      print('---$error');
      if (error is UnauthorizedError) {
        value = null;
      }
    });
  }

  User get currentUser => value;

  Future<void> signIn(String email) async {
    value = User(email: email);
  }
}
