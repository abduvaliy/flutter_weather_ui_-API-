import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_tutorial/domain/states/app_state.dart';

import '../../utils/utils.dart';

Future<dynamic> showModelBottomSheet(
    BuildContext context, TextEditingController controller) {
  return showModalBottomSheet(
    backgroundColor: kxtBackgraound,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    context: context,
    builder: (_) {
      final bottomInset = MediaQuery.of(context).viewInsets.bottom;
      final iButtonShow = bottomInset < 1;
      return Padding(
        padding: const EdgeInsets.all(30.0).copyWith(
          bottom: iButtonShow ? 40 : bottomInset + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              cursorColor: kxtGlowContainer,
              style: TextStyle(
                color: kxtGlowContainer,
              ),
              controller: controller,
              decoration: InputDecoration(
                iconColor: kxtGlowContainer,
                labelStyle: TextStyle(color: kxtGlowContainer),
                labelText: "City",
                hintText: 'Enter City Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: kxtGlowContainer,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            if (iButtonShow)
              SizedBox(
                width: double.infinity,
                height: 48.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kxtGlowContainer,
                    shadowColor: kxtGlowContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    final cityName = controller.text;
                    final state = context.read<AppState>();
                    state.getCurrentWeather(cityName);
                    state.changeCityName(cityName);
                    controller.clear();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Search by City',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}
