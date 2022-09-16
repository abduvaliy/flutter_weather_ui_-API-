import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:weather_tutorial/domain/entity/weather_api.dart';
import 'package:weather_tutorial/domain/service/weather_service.dart';
import 'package:weather_tutorial/ui/utils/show_snackbar.dart';

//agar kod da nimadur ozgramasa ChangeNotidfier keremas, prosta bervorihs kere
//bosa ishlatilmidi.
//agar nimadur ozgaradigna bosa CHangeNotifer ishlatililandi.
class AppState extends ChangeNotifier {
  WeatherEntity? _data;
  List<WeatherEntity>? _forecastDate;
  List<WeatherEntity>? _allForecastData;
  List<WeatherEntity>? _sixForecastData;
  bool _isLoading = false;
  String _cityName = 'Tashkent';

  WeatherEntity? get weatherData => _data;
  List<WeatherEntity>? get forecastDate => _forecastDate;
  List<WeatherEntity>? get allForecastData => _allForecastData;
  List<WeatherEntity>? get sixForecastData => _sixForecastData;
  bool get isLoading => _isLoading;
  String get cityName => _cityName;

  // @override
  // void initState() {
  //   getCurrentWeather();
  //   super.initState();
  // }
  //this is like initState() {}
  AppState() {
    getCurrentWeather();
  }

  void getCurrentWeather([String cityName = 'Tashkent']) async {
    _isLoading = true;
    //ChangeNotifier extends
    notifyListeners();
    //setStateOrniga ishaltilandi.
    // setState(() {});
    try {
      _data = await WeatherService.fetchCurrentWeather(cityName);
      _allForecastData = await WeatherService.fetchForecastWeather(cityName);
      filterTodayForecast();
    } on DioError catch (e) {
      showSnackBar(e.message.isEmpty ? e.toString() : e.message);
    } catch (e) {
      showSnackBar('Unknown Error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void filterTodayForecast() {
    final data = _allForecastData;
    if (data == null) return;
    final now = DateTime.now();
    final nowData = DateTime(now.year, now.month, now.day);
    List<WeatherEntity> equalToNowDate = [];

    for (var element in data) {
      final time = element.dateTime;
      if (time != null) {
        final forecastDate = DateTime(time.year, time.month, time.day);
        if (nowData.compareTo(forecastDate) == 0) {
          equalToNowDate.add(element);
        }
      }
    }
    _forecastDate = equalToNowDate;
    notifyListeners();
    filterFiveDays();
  }

  void filterFiveDays() {
    final data = _allForecastData;
    if (data == null) return;

    List<WeatherEntity> fiveForecast = [];
    final times = [];

    for (var item in data) {
      final insideTime = item.dateTime;
      if (insideTime == null) continue;
      final formmattedDate = DateFormat('dd/MM/yyyy').format(insideTime);
      if (!times.contains(formmattedDate)) {
        fiveForecast.add(item);
        times.add(formmattedDate);
      }
    }

    _sixForecastData = fiveForecast;
    notifyListeners();
  }

  void changeCityName(String name) {
    _cityName = name;
    notifyListeners();
  }
}
