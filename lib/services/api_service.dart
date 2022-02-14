import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  final baseUrl = 'https://reqres.in';

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    initializeInterceptors();
  }

  Future<Response> getRequest(String endpoint) async {
    Response response;

    try {
      response = await _dio.get(endpoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        print(e.message);
        return handler.next(e);
      },
      onRequest: (request, handler) {
        print("${request.method} ${request.path}");
        return handler.next(request);
      },
      onResponse: (response, handler) {
        print(response.data);
        return handler.next(response);
      },
    ));
  }
}
