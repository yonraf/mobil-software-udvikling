import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';
import 'package:justrandom/screens/components/feauture_button.dart';
import 'package:justrandom/screens/random_number.dart';
import 'package:justrandom/screens/wheel_of_fortune.dart';

import 'coin_flip.dart';
import 'dice.dart';
import 'list_shuffle.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FeatureButton("Dice Throw", kDiceThemeColor, Dice()),
            FeatureButton("Shuffle List", kShuffleThemeColor, ListShuffle()),
            FeatureButton("Wheel of Fortune", kWheelThemeColor, WheelOfFortune()),
            FeatureButton("Number Generator", kNumberThemeColor, RandomNumber()),
            FeatureButton("Coin Flip", kCoinThemeColor, CoinFlip()),
          ],
        ),
      )
    );
  }

}