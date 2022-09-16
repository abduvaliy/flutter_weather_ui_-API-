import 'package:dio/dio.dart';
import 'package:weather_tutorial/data/API/api_interceptor.dart';

class ApiClient {
  final dio = createDio();

  static Dio createDio() {
    final dio = Dio(BaseOptions(baseUrl: _baseUrl));

    dio.interceptors.addAll({
      ApiInterceptors(dio),
    });
    return dio;
  }

  ApiClient._internal();

  static final _singleton = ApiClient._internal();
  factory ApiClient() => _singleton;

  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const iconUrl = 'http://openweathermap.org/img/wn/';
  static const apiKey = 'e32fbfab59364c76354076dd66214d6a';
}
