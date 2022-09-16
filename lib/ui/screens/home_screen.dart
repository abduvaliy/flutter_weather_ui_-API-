import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_tutorial/domain/states/app_state.dart';

import 'current_weather.dart';
import 'six_days_weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecastDate = context.watch<AppState>().forecastDate;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFD3D3D3),
      body: Column(
        children: [
          const CurrentWeather(),
          if (forecastDate != null) const SixDayWeather(),
        ],
      ),
    );
  }
}
