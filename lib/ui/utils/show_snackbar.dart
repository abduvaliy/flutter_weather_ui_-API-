import 'package:flutter/material.dart';
import 'package:weather_tutorial/main.dart';

void showSnackBar(String text, {bool isError = true}) {
  final snackbar = SnackBar(
    backgroundColor: isError ? Colors.black : Colors.white,
    content: Text(text,
        style: TextStyle(
          fontSize: 15.0,
          color: isError ? Colors.white : Colors.black,
        )),
  );
  massengerKey.currentState
    ?..removeCurrentSnackBar()
    ..showSnackBar(snackbar);
}
