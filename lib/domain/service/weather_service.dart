import 'package:weather_tutorial/data/API/api_client.dart';
import 'package:weather_tutorial/domain/entity/weather_api.dart';

class WeatherService {
  static Future<WeatherEntity?> fetchCurrentWeather(String city) async {
    final queryParams = {
      'q': city,
      'units': 'metric',
      'appid': ApiClient.apiKey,
    };

    final response = await ApiClient().dio.get(
          '/weather',
          queryParameters: queryParams,
        );
    final data = response.data as Map<String, dynamic>;
    return WeatherEntity.fromJson(data);
  }

  static Future<List<WeatherEntity>?> fetchForecastWeather(String city) async {
    final queryParams = {
      'q': city,
      'units': 'metric',
      'appid': ApiClient.apiKey,
    };

    final response = await ApiClient().dio.get(
          '/forecast',
          queryParameters: queryParams,
        );
    final data = response.data['list'] as List;
    return data.map((e) => WeatherEntity.fromJson(e)).toList();
  }
}
