import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';
import 'package:justrandom/screens/components/feauture_button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FeatureButton("Dice Throw", kDiceThemeColor),
            FeatureButton("Shuffle List", kShuffleThemeColor),
            FeatureButton("Wheel of Fortune", kWheelThemeColor),
            FeatureButton("Number Generator", kNumberThemeColor),
            FeatureButton("Coin Flip", kCoinThemeColor),
          ],
        ),
      )
    );
  }

}