import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/screens/components/feauture_button.dart';
import 'package:justrandom/screens/randomizers/random_number.dart';
import 'package:justrandom/screens/randomizers/wheel_of_fortune.dart';

import 'coin_flip.dart';
import 'dice.dart';
import 'list_shuffle.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, screenHeight * 0.03),
              child: Image(
                image: AssetImage('assets/logo.png'),
                height: 45,
              ),
            ),
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