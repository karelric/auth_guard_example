import 'package:auth_guard/src/models/product.dart';
import 'package:auth_guard/src/services/api_service.dart';
import 'package:auth_guard/src/services/auth_service.dart';
import 'package:auth_guard/src/utils/http_errors.dart';
import 'package:http/http.dart';

class ProductService {
  final ApiService _apiSrv;

  final AuthService _authSrv;

  ProductService(this._apiSrv, this._authSrv);

  Future<Product> fetchById(String id) async {
    /// only for test purpose
    final resp = await _apiSrv.get('/throw/401');

    /// from response.body
    return Product();
  }
}
