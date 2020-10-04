import 'dart:async';
import 'dart:convert';

import '../utils/http_errors.dart';
import 'package:http/http.dart';

class ApiService extends BaseClient {
  final Client _http;

  StreamController<Error> _onError;

  ApiService(this._http);

  Stream<Error> get onError {
    _onError ??= StreamController<Error>.broadcast();
    return _onError.stream;
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) => _http.send(request);

  @override
  Future<Response> get(url, {Map<String, String> headers}) async {
    /// only for test purpose
    if (url == '/throw/401') {
      _throwIfError(Response('', 401));
    }

    return super.get(url, headers: headers);
  }

  @override
  Future<Response> post(
    url, {
    Map<String, String> headers,
    body,
    Encoding encoding,
  }) async {
    final resp = await super.post(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );
    return _throwIfError(resp);
  }

  /// Return same response if 200 < statusCode < 400
  /// otherwise throws an HttpError
  Response _throwIfError(Response response) {
    if (response.statusCode >= 400) {
      final error = () {
        switch (response.statusCode) {
          case 400:
            return BadRequestError(response);

          case 401:
            return UnauthorizedError(response);

          case 403:
            return AccessDeniedError(response);

          case 404:
            return NotFoundError(response);

          default:
            return InternalError(response);
        }
      }();
      _onError?.add(error);
      throw error;
    }
    return response;
  }
}
