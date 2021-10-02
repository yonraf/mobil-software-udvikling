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
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical : MediaQuery.of(context).size.height * 0.06, horizontal: 5),
      child: Row(
        children: [
          HomeButton(randomizer.themeColor),
          Text(
            randomizer.name,
            style: TextStyle(
              fontFamily: 'Abel',
              color: Colors.black,
              fontWeight: FontWeight.w200,
              decoration: TextDecoration.none,
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}