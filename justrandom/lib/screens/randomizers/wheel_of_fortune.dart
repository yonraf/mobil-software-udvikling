import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:justrandom/screens/components/action_button.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';

class WheelOfFortune extends StatelessWidget implements Randomizer {
  //StreamController<int> selected = StreamController<int>();
  var inputs = <String>[
    "Mustafa",
    "Kiko",
    "Baba",
    "FTP",
    "Cingo",
  ];

  @override
  String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  String name = 'Wheel of Fortune';

  @override
  Color themeColor = kWheelThemeColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        child: Column(
          children: [
            TopBar(WheelOfFortune()),
            Row(
              children: [
                //TextField(),
                ElevatedButton(onPressed: () {
                  print("+");
                }, child: Text('+'))
              ],
            ),
            ActionButton(WheelOfFortune(), 'SPIN')
          ],
        ),
      ),
    );
  }

  @override
  void run() {
    // TODO: implement run
  }
}

/*
FortuneWheel(
                  animateFirst: true,
                  items: [
                    for (var input in inputs)
                      FortuneItem(
                          child: Text(input)
                      )
                  ],
            )
 */