import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/screens/components/help_button.dart';
import 'package:justrandom/screens/components/home_button.dart';

import '../randomizer.dart';


class TopBar extends StatelessWidget {
  TopBar(this.randomizer);
  Randomizer randomizer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: AppBar(
        title: Text(randomizer.name, style: TextStyle(
          fontFamily: 'Abel',
          color: Colors.black,
          fontWeight: FontWeight.w200,
          decoration: TextDecoration.none,
          fontSize: MediaQuery.of(context).size.width < 700
              ? MediaQuery.of(context).size.width * 0.09
              : 45
        ),),
        leading : HomeButton(randomizer.themeColor),
        actions: [
          HelpButton(randomizer)
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
    );
  }
}