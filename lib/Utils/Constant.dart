import 'package:flutter/material.dart';

class Constant {
  TextStyle mainTitle = TextStyle(fontSize: 32, color: Colors.white);
  TextStyle mainHintStyle =
      TextStyle(fontSize: 24, color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold);
  Color bgBottomColor = Color.fromRGBO(150, 98, 161, 1);
  Color bgTopColor = Color.fromRGBO(18, 34, 88, 1);
  String apiKey = '4f969564b56c46c984f183131212603';
  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
