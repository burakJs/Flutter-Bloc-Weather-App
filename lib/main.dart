import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherbi/Cubit/WeatherCubit.dart';
import 'package:weatherbi/Cubit/WeatherRepository.dart';
import 'package:weatherbi/Pages/Details.dart';
import 'package:weatherbi/Pages/HomePage.dart';
import 'package:weatherbi/Utils/Constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherRepository()),
      child: MaterialApp(
        title: 'WeatherBI',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => buildMain(HomePage()),
          '/details': (context) => buildMain(Details()),
        },
      ),
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
