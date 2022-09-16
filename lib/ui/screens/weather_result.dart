import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../domain/states/app_state.dart';
import '../utils/utils.dart';
import '../widgets/extra_weather.dart';

class WeatherResult extends StatelessWidget {
  const WeatherResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.watch<AppState>().weatherData;
    final read = context.read<AppState>();
    if (data == null) return const SizedBox.shrink();
    final iconID = data.weather != null ? data.weather!.first.icon : null;
    return Column(
      children: <Widget>[
        OutlinedButton(
          onPressed: read.getCurrentWeather,
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              side: BorderSide(width: 0.3.w, color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: const Text(
            "Updating",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
          child: Column(
            children: [
              if (iconID != null)
                Image.network(
                  getIconUrl(iconID),
                  width: SizerUtil.width * .6,
                  fit: BoxFit.fill,
                ),
              Center(
                child: Column(
                  children: [
                    GlowText(
                      '${data.main?.temp?.round().toString()}°C',
                      style: TextStyle(
                          height: 0.1,
                          fontSize: 60.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      (data.weather?.first.main ?? '-'),
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 0.3.h,
                    ),
                    Text(
                      getCurrentDate(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        const ExtraWeather()
      ],
    );
  }
}
