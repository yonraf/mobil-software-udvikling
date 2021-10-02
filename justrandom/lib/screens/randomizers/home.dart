import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';
import 'package:justrandom/screens/components/feauture_button.dart';
import 'package:justrandom/screens/randomizers/random_number.dart';
import 'package:justrandom/screens/randomizers/wheel_of_fortune.dart';

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
          //crossAxisAlignment: CrossAxisAlignment.center,
          //main
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FeatureButton(Dice()),
            FeatureButton(ListShuffle()),
            FeatureButton(WheelOfFortune()),
            FeatureButton(RandomNumber()),
            FeatureButton(CoinFlip()),
            Padding(padding: EdgeInsets.all(20))
          ],
        ),
      )
    );
  }

}