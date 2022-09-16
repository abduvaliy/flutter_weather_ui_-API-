import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/states/app_state.dart';
import '../widgets/dialogs/weather_widget.dart';
import 'detail_screens/detail_screen.dart';

class SixDayWeather extends StatelessWidget {
  const SixDayWeather({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              if (state.sixForecastData != null)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const DetailScreen();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      Text(
                        "6 days",
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black87,
                        size: 15,
                      )
                    ],
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: state.forecastDate == null
                ? const SizedBox.shrink()
                : Row(
                    children: List.generate(
                      state.forecastDate?.length ?? 0,
                      (index) => WeatherWidget(
                        state.forecastDate![index],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
