import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../randomizer.dart';


class ActionButton extends StatelessWidget {
  ActionButton(this.randomizer, this.buttonText);
  Randomizer randomizer;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
    child : ElevatedButton(
    child: Text(
      buttonText,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.height * 0.04,
        fontFamily: 'Abel',
        fontWeight: FontWeight.w200,
      ),
    ),
        onPressed: () {
      randomizer.run();
    },
    style: ElevatedButton.styleFrom(
      primary: this.randomizer.themeColor,
      fixedSize: Size(MediaQuery.of(context).size.width * 0.90, MediaQuery.of(context).size.height * 0.1),
    ),
    ),
    );
  }
}