import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';
// import 'package:justrandom/screens/components/action_button.dart';
import 'package:justrandom/screens/randomizer.dart';

import '../components/top_bar.dart';

class ListShuffle extends StatefulWidget implements Randomizer {
  @override
  String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  String name = 'Shuffle List';

  @override
  Color themeColor = kShuffleThemeColor;

  ListShuffle();

  @override
  _ListShuffleState createState() =>  _ListShuffleState();

}

class _ListShuffleState extends State<ListShuffle> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          TopBar(ListShuffle()),
         // ActionButton(ListShuffle(), "Shuffle")
        ],
      ),
    );
  }

}