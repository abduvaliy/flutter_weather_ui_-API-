import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/states/app_state.dart';
import '../utils/utils.dart';

class CityName extends StatefulWidget {
  const CityName({
    Key? key,
  }) : super(key: key);
  @override
  State<CityName> createState() => _CityNameState();
}

class _CityNameState extends State<CityName> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cityname = context.select((AppState state) => state.cityName);
    return GestureDetector(
      onTap: () {
        showModelBottomSheet(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.map_fill, color: Colors.white),
          Text(
            ' $cityname',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showModelBottomSheet(BuildContext context) {
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
                controller: _controller,
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
                      final cityName = _controller.text;
                      final state = context.read<AppState>();
                      state.getCurrentWeather(cityName);
                      state.changeCityName(cityName);
                      _controller.clear();
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
}
