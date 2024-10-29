import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void addDioHeaders() async {
    _dio?.options.headers = {
      'Accept': 'application/json',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static void addDioInterceptor() {
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        compact: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
      ),
    );
  }
}
