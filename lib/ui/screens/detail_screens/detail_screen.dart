import 'package:flutter/material.dart';
import 'detail_todat_weather.dart';
import 'six_days.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3D3D3),
      body: Column(
        children: const [
          DetailTodayWeather(),
          SixDays(),
        ],
      ),
    );
  }
}
