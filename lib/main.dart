import 'package:auth_guard/src/services/api_service.dart';
import 'package:auth_guard/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:auth_guard/src/services/product_service.dart';
import 'package:auth_guard/src/widgets/app.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  final client = Client();
  final apiSrv = ApiService(client);
  final authSrv = AuthService(apiSrv);
  final productSrv = ProductService(apiSrv, authSrv);

  runApp(MultiProvider(
    providers: [
      Provider<ApiService>(create: (_) => apiSrv),
      Provider<AuthService>(create: (_) => authSrv),
      Provider<ProductService>(create: (_) => productSrv),
    ],
    child: App(),
  ));
}
