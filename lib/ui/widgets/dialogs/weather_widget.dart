import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/entity/weather_api.dart';
import '../../utils/utils.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherEntity data;
  const WeatherWidget(this.data, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final iconID = data.weather != null ? data.weather!.first.icon : null;
    final temp = data.main?.temp?.round() ?? '-';
    final time = DateFormat('HH:mm').format(data.dateTime!);
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 0.1.h, color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            " $temp \u00B0",
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          if (iconID != null)
            Image.network(
              getIconUrl(iconID),
              width: 50,
              height: 50,
            ),
          const SizedBox(
            height: 5,
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
