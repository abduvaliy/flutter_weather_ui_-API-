import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_tutorial/domain/states/app_state.dart';
import 'package:weather_tutorial/ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

final massengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //(_) => context
      create: (_) => AppState(),
      child: Sizer(builder: (context, _, __) {
        return MaterialApp(
          title: 'Weather',
          theme: ThemeData(
              textTheme: Theme.of(context)
                  .textTheme
                  .apply(bodyColor: Colors.white, displayColor: Colors.blue)),
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: massengerKey,
          home: const HomePage(),
        );
      }),
    );
  }
}
