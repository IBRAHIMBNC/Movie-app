import 'package:dio/dio.dart';

class ApiService {
  const ApiService._();
  static final String _baseUrl = "https://api.themoviedb.org/3";

  static Future<Dio> launchDio({bool? isMultiform = false}) async {
    const String _accessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MDRlMjQ3N2MzNTI1MGUzMjI3NzEwODc3ODc2MTI0YyIsIm5iZiI6MTczNjI1MzY4Ny43MzksInN1YiI6IjY3N2QyMGY3ZDEwMmU3NzZmNTc0OTNkNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TFH11nUk5nkNqm2hIaVXWFqNPOTc8F88abZBp_d5Qh8';
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.options.headers['Content-Type'] =
        isMultiform == true ? 'multipart/form-data' : 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer $_accessToken';

    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) {
      if (status != null) {
        return status < 500;
      } else {
        return false;
      }
    };
    return dio;
  }

  static Future<Response<dynamic>?> get(
      {required String endPoint, Map<String, dynamic>? params}) async {
    params = _addApiKeyToParams(params);
    try {
      Dio dio = await launchDio();
      final response =
          await dio.get('$_baseUrl/$endPoint', queryParameters: params);
      return response;
    } catch (e) {
      // logger.e(e);
      return null;
    }
  }

  static _addApiKeyToParams(Map<String, dynamic>? params) {
    if (params != null) {
      params['api_key'] = "604e2477c35250e3227710877876124c";
    }
    return params;
  }
}
