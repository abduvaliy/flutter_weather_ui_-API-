// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../domain/states/app_state.dart';
import 'city_name.dart';
import 'weather_result.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return GlowContainer(
      height: MediaQuery.of(context).size.height - 29.h,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.only(top: 50, left: 30, right: 30),
      glowColor: Color(0xFF0A0A0A).withOpacity(0.5),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      color: Color(0xFF373737),
      spreadRadius: 5,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CityName(),
            if (state.isLoading)
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
              )
            else if (state.weatherData == null)
              Center(
                child: Text('Empty data'),
              )
            else
              WeatherResult()
          ],
        ),
      ),
    );
  }
}
