import 'package:dio/dio.dart';

class ApiService {
  static final String _baseUrl = "https://api.themoviedb.org/3";
  static const String _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MDRlMjQ3N2MzNTI1MGUzMjI3NzEwODc3ODc2MTI0YyIsIm5iZiI6MTczNjI1MzY4Ny43MzksInN1YiI6IjY3N2QyMGY3ZDEwMmU3NzZmNTc0OTNkNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TFH11nUk5nkNqm2hIaVXWFqNPOTc8F88abZBp_d5Qh8';
  static const String _api_key = "604e2477c35250e3227710877876124c";

  static Future<Dio> _createDio({bool? isMultiform = false}) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.options.headers['Content-Type'] =
        isMultiform == true ? 'multipart/form-data' : 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer $_accessToken';
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) => status != null && status < 500;
    return dio;
  }

  static Future<Response<dynamic>?> get(
      {required String endPoint, Map<String, dynamic>? params}) async {
    params = _addApiKeyToParams(params);
    try {
      Dio dio = await _createDio();
      final response =
          await dio.get('$_baseUrl/$endPoint', queryParameters: params);
      return response;
    } catch (e) {
      return null;
    }
  }

  static Map<String, dynamic>? _addApiKeyToParams(
      Map<String, dynamic>? params) {
    if (params != null) {
      params['api_key'] = _api_key;
    }
    return params;
  }
}
