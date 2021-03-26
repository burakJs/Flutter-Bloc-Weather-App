import 'package:flutter/material.dart';
import 'package:weatherbi/Utils/Constant.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          mainTitleText(),
          mainGetWeatherTextField(),
          mainGetWeatherButton(context),
        ],
      ),
    );
  }

  Center mainTitleText() {
    return Center(
      child: Text(
        'WeatherBI',
        style: Constant().mainTitle,
      ),
    );
  }

  TextField mainGetWeatherTextField() {
    return TextField(
      textAlign: TextAlign.center,
      style: Constant().mainHintStyle,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.location_on,
          color: Colors.white,
          size: 48,
        ),
        hintText: "Location",
        hintStyle: Constant().mainHintStyle,
        border: InputBorder.none,
      ),
    );
  }

  Container mainGetWeatherButton(BuildContext context) {
    return Container(
      height: Constant().getHeight(context) / 15,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/details');
        },
        child: Text(
          "Get Weather",
          style: Constant().mainTitle,
        ),
      ),
    );
  }
}
