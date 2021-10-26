import 'package:flutter/material.dart';
import 'package:myapp2/BMICalculator/bmimainpage.dart';
import 'package:myapp2/pages/home.dart';
import 'package:myapp2/pages/choose_loc.dart';
import 'package:myapp2/loading_page.dart';
import 'package:myapp2/pages/choose.dart';

void main() => runApp(
      MaterialApp(
        title: 'Flutter project',
        debugShowCheckedModeBanner: false,
        initialRoute: '/first',
        routes: {
          '/first': (context) => const LoadingPage(),
          '/second': (context) => const ListOfWidgets(),
          '/weather-app': (context) => const Home(),
          '/weather-app-location': (context) => const ChooseLocation(),
          '/bmi-app': (context) => BMICalculator(),
          //'/' : (context) => const LoadingPage(),
          //'/home': (context) => const ListOfWidgets(),
        },
      ),
    );
