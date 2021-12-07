import 'package:flutter/material.dart';
import 'package:myapp2/Weather_app/constants.dart';
import 'package:myapp2/Weather_app/pages/loading_screen.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(
          color: kBackgroundColor,
          elevation: 0,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoadingScreenL(),
    );
  }
}
