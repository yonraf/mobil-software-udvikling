import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/screens/components/home_button.dart';

import '../randomizer.dart';


class TopBar extends StatelessWidget {
  TopBar(this.randomizer);
  Randomizer randomizer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: AppBar(
        title: Text(randomizer.name, style: TextStyle(
          fontFamily: 'Abel',
          color: Colors.black,
          fontWeight: FontWeight.w200,
          decoration: TextDecoration.none,
          fontSize: 40,
        ),),
        leading : HomeButton(randomizer.themeColor),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
    );
  }
}