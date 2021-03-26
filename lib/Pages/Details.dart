import 'package:flutter/material.dart';
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
    setState(() {
      var weather = ModalRoute.of(context).settings.arguments as Map;
      print(weather['state']);
    });
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildAppBarTitle(),
              Text(
                "Partly Cloud",
                style: Constant().mainTitle.copyWith(fontWeight: FontWeight.w300, fontSize: 64),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildMiddleLeftDesign(),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: buildMiddleAllRight(topValue: 28, bottomValue: 17),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildMiddleAllRight(topValue: 28, bottomValue: "M", isSeen: false),
                  buildMiddleAllRight(topValue: 28, bottomValue: "T", isSeen: false),
                  buildMiddleAllRight(topValue: 28, bottomValue: "W", isSeen: false),
                  buildMiddleAllRight(topValue: 28, bottomValue: "T", isSeen: false),
                  buildMiddleAllRight(topValue: 28, bottomValue: "F", isSeen: false),
                  buildMiddleAllRight(topValue: 28, bottomValue: "S", isSeen: false),
                  buildMiddleAllRight(topValue: 28, bottomValue: "S", isSeen: false),
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

  Column buildMiddleLeftDesign() {
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
                '23',
                style: Constant().mainTitle.copyWith(fontWeight: FontWeight.w200, fontSize: 128),
              ),
            ),
          ],
        )
      ],
    );
  }

  Column buildAppBarTitle() {
    return Column(
      children: [
        Text(
          "Eskişehir",
          style: Constant().mainTitle.copyWith(fontWeight: FontWeight.w300),
        ),
        Text(
          "12:30",
          style: Constant().mainTitle.copyWith(fontWeight: FontWeight.w300, fontSize: 24),
        ),
      ],
    );
  }
}
