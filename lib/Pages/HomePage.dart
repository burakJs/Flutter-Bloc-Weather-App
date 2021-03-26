import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherbi/Cubit/WeatherCubit.dart';
import 'package:weatherbi/Cubit/WeatherState.dart';
import 'package:weatherbi/Utils/Constant.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tfcity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is WeatherInitial) {
          return buildPage(context, state);
        }
        if (state is WeatherLoading) {
          return CircularProgressIndicator();
        } else if (state is WeatherDone) {
          return buildPage(context, state);
        } else {
          return buildError(state);
        }
      },
    );
  }

  Padding buildPage(BuildContext context, WeatherState state) {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          mainTitleText(),
          mainGetWeatherTextField(),
          mainGetWeatherButton(context, state),
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
      controller: tfcity,
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

  Container mainGetWeatherButton(BuildContext context, WeatherState state) {
    return Container(
      height: Constant().getHeight(context) / 15,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {
          BlocProvider.of<WeatherCubit>(context).getLocation(tfcity.text);
          if (state is WeatherDone) {
            Navigator.pushNamed(context, '/details', arguments: {'state': state});
          }
        },
        child: Text(
          "Get Weather",
          style: Constant().mainTitle,
        ),
      ),
    );
  }

  Text buildError(WeatherState state) {
    final error = state as WeatherError;
    return Text(error.message);
  }
}
