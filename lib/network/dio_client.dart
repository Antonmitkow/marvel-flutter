import 'package:dio/dio.dart';
import 'package:flutter_labs/network/base_url.dart';

class DioClient implements Interceptor {
  Dio get dio => _dio;

  DioClient() {
    init();
  }
  final Dio _dio = Dio();

  void init() {
    _dio.options = BaseOptions(baseUrl: baseUrl);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
