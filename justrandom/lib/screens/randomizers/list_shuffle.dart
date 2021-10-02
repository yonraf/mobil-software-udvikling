import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';
import 'package:justrandom/screens/randomizer.dart';

import '../components/top_bar.dart';

class ListShuffle extends StatelessWidget implements Randomizer{

  @override
  String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  String name = 'Shuffle List';

  @override
  Color themeColor = kShuffleThemeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          TopBar(ListShuffle())
        ],
      ),
    );
  }

  @override
  void run() {
    // TODO: implement run
  }
}