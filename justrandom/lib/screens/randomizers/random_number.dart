import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';

class RandomNumber extends StatefulWidget implements Randomizer {
  @override
  String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  String name = 'Number Generator';

  @override
  Color themeColor = kNumberThemeColor;

  RandomNumber();

  @override
  _RandomNumberState createState() => _RandomNumberState();
}


class _RandomNumberState extends State<RandomNumber> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          TopBar(RandomNumber()),
        ],
      ),
    );
  }
}