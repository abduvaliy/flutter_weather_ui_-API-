import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_tutorial/domain/states/app_state.dart';

class ExtraWeather extends StatelessWidget {
  const ExtraWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.select((AppState state) => state).weatherData;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${data?.wind?.speed ?? 0}Km/h",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Wind",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${data?.main?.humidity ?? 0} %",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Humidity",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${data?.main?.pressure ?? 0}%",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Pressure",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        )
      ],
    );
  }
}
