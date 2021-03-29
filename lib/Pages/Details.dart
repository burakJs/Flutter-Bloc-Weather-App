import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherbi/Cubit/WeatherCubit.dart';
import 'package:weatherbi/Cubit/WeatherState.dart';
import 'package:weatherbi/Utils/Constant.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        /* if (state is WeatherInitial) {
          return buildSafeArea(context);
        } */
        if (state is WeatherLoading) {
          return CircularProgressIndicator();
        } else if (state is WeatherDone) {
          return buildSafeArea(context, state);
        } else {
          return buildError(state);
        }
      },
    );
  }

  Text buildError(WeatherState state) {
    final error = state as WeatherError;
    return Text(error.message);
  }

  SafeArea buildSafeArea(BuildContext context, WeatherDone state) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildAppBarTitle(state),
              Text(
                state.weather.current.condition.text,
                style: Constant().mainTitle.copyWith(fontWeight: FontWeight.w300, fontSize: 64),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: buildMiddleLeftDesign(state),
                  ),
                  // buildMiddleAllRight(topValue: 28, bottomValue: 17),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildMiddleAllRight({topValue, bottomValue, isSeen = true}) {
    return Column(
      children: [
        buildMiddleRight(topValue, isSeen: true),
        buildDivider(),
        buildMiddleRight(bottomValue, isSeen: isSeen),
      ],
    );
  }

  Padding buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 55,
        color: Colors.white,
        height: 1,
      ),
    );
  }

  Stack buildMiddleRight(value, {isSeen = true}) {
    return Stack(
      children: [
        isSeen
            ? Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                ),
              )
            : Text(""),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            '$value',
            style: Constant().mainTitle.copyWith(fontWeight: FontWeight.w200, fontSize: 32),
          ),
        ),
      ],
    );
  }

  Column buildMiddleLeftDesign(WeatherDone state) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
              right: 0,
              top: 32,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32),
              child: Text(
                state.weather.current.feelslikeC.toString(),
                style: Constant().mainTitle.copyWith(fontWeight: FontWeight.w200, fontSize: 128),
              ),
            ),
          ],
        )
      ],
    );
  }

  Column buildAppBarTitle(WeatherDone state) {
    return Column(
      children: [
        Text(
          state.weather.location.name,
          style: Constant().mainTitle.copyWith(fontWeight: FontWeight.w300),
        ),
        Text(
          state.weather.location.localtime,
          style: Constant().mainTitle.copyWith(fontWeight: FontWeight.w300, fontSize: 24),
        ),
      ],
    );
  }
}
