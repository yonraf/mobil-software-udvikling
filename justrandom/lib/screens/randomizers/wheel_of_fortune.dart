import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';

class WheelOfFortune extends StatefulWidget implements Randomizer {
  @override
  String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  String name = 'Wheel of Fortune';

  @override
  Color themeColor = kWheelThemeColor;

  WheelOfFortune();

  @override
  _WheelOfFortuneState createState() => _WheelOfFortuneState();
}

class _WheelOfFortuneState extends State<WheelOfFortune> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          TopBar(WheelOfFortune())
        ],
      ),
    );
  }
}