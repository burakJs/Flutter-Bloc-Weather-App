import 'package:flutter/material.dart';
import 'package:weatherbi/Pages/Details.dart';
import 'package:weatherbi/Pages/HomePage.dart';
import 'package:weatherbi/Utils/Constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherBI',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => buildMain(HomePage()),
        '/details': (context) => buildMain(Details()),
      },
    );
  }

  Scaffold buildMain(page) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Constant().bgTopColor,
                Constant().bgBottomColor,
              ],
            ),
          ),
          child: page,
        ),
      ),
    );
  }
}
