import 'package:auth_guard/src/services/api_service.dart';
import 'package:auth_guard/src/services/auth_service.dart';
import 'package:auth_guard/src/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ApiProvider {
  static ApiService of(BuildContext context) {
    return Provider.of<ApiService>(context, listen: false);
  }
}

abstract class AuthProvider {
  static AuthService of(BuildContext context) {
    return Provider.of<AuthService>(context, listen: false);
  }
}

abstract class ProductProvider {
  static ProductService of(BuildContext context) {
    return Provider.of<ProductService>(context, listen: false);
  }
}
