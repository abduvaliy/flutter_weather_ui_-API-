// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/states/app_state.dart';
import '../../utils/utils.dart';

class DetailTodayWeather extends StatelessWidget {
  const DetailTodayWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final todayData =
        context.select((AppState state) => state.sixForecastData?.first);
    if (todayData == null) return const SizedBox.shrink();
    final iconID =
        todayData.weather != null ? todayData.weather!.first.icon : null;
    return GlowContainer(
      color: const Color(0xFF373737),
      glowColor: const Color(0xFF000000),
      borderRadius: const BorderRadius.only(
        bottomLeft: const Radius.circular(60),
        bottomRight: const Radius.circular(60),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              right: 30,
              left: 30,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    Text(
                      " 6 days",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(width: 24),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (iconID != null)
                  Image.network(
                    getIconUrl(iconID),
                    width: 150,
                    height: 150,
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Today",
                      style: TextStyle(fontSize: 30, height: 0.1),
                    ),
                    SizedBox(
                      height: 105,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GlowText(
                            '${todayData.main?.tempMax?.round() ?? '-'}',
                            style: TextStyle(
                                fontSize: 60.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "/${todayData.main?.tempMin?.round() ?? '-'} \u00B0",
                            style: TextStyle(
                                color: Colors.white70.withOpacity(0.3),
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      " ${todayData.weather?.first.main ?? ''}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              right: 50,
              left: 50,
            ),
            child: Column(
              children: const [
                Divider(color: Colors.white),
                SizedBox(
                  height: 10,
                ),
                // ExtraWeather()
              ],
            ),
          )
        ],
      ),
    );
  }
}
