import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';
import 'package:justrandom/screens/components/action_button.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';

class CoinFlip extends StatefulWidget implements Randomizer {
  @override
  String description = 'Flip the coin to make a decision between two options';

  @override
  String name = 'Coin Flip';

  @override
  Color themeColor = kCoinThemeColor;

  CoinFlip();

  @override
  _CoinFlipState createState() => _CoinFlipState();
}


class _CoinFlipState extends State<CoinFlip> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          TopBar(CoinFlip()),
          ActionButton(CoinFlip(), "Flip")
        ],
      ),
    );
  }
}