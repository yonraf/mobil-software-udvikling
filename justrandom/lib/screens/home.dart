import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            FeatureButton("Dice"),
            FeatureButton("Wheel of fortune"),
            FeatureButton("Coin Flip"),
            FeatureButton("Shuffle list"),
            FeatureButton("Random number"),
          ],
        ),
      )
    );
  }

}