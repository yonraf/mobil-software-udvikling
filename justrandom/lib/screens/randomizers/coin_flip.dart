import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';

class CoinFlip extends StatelessWidget implements Randomizer {

  @override
  String description = 'Flip the coin to make a decision between two options';

  @override
  String name = 'Coin Flip';

  @override
  Color themeColor = kCoinThemeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          TopBar(CoinFlip())
        ],
      ),
    );
  }

  @override
  void run() {
    // TODO: implement run
  }
}