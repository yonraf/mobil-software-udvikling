import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';
import 'package:justrandom/screens/components/action_button.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';

class Dice extends StatelessWidget implements Randomizer {

  @override
  String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  String name = 'Dice Throw';

  @override
  Color themeColor = kDiceThemeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          TopBar(Dice()),
          ActionButton(Dice(), "Throw"),
        ],
      ),
    );
  }

  @override
  void run() {
    // TODO: implement run
  }
}
