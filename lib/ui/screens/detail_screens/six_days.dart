import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../domain/states/app_state.dart';
import '../../utils/utils.dart';

class SixDays extends StatelessWidget {
  const SixDays({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final sixDays = context.select((AppState state) => state.sixForecastData);
    if (sixDays == null) return const SizedBox.shrink();
    final data = sixDays.getRange(1, sixDays.length).toList();
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          final sixDayCurrentData = data[index];
          final boool = sixDayCurrentData.dateTime;
          if (boool == null) return const SizedBox();
          final sixDayCurrentDay = DateFormat('EEE').format(boool);
          final iconID = sixDayCurrentData.weather != null
              ? sixDayCurrentData.weather!.first.icon
              : null;
          final weatherName = sixDayCurrentData.weather?.first.main;
          final tempMIN =
              "/${sixDayCurrentData.main?.tempMin?.round() ?? '-'} \u00B0";
          final tempMAX =
              '${sixDayCurrentData.main?.tempMax?.round() ?? '-'} \u00B0';
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sixDayCurrentDay,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  width: 135,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (iconID != null)
                        Image.network(
                          getIconUrl(iconID),
                          width: 45,
                          height: 45,
                        ),
                      const SizedBox(width: 15),
                      Text(
                        weatherName ?? '',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      tempMAX,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      tempMIN,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
