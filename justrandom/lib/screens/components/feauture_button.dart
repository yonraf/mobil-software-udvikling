import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dice.dart';


class FeatureButton extends StatelessWidget {
  FeatureButton(this.buttonText, this.buttonColor);
  var buttonText;
  Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
      child : ElevatedButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dice()),
          );
        }, child: Text(
          this.buttonText,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.04,
          fontFamily: 'Abel',
          fontWeight: FontWeight.w200,
        ),
      ),
          style: ElevatedButton.styleFrom(
            primary: this.buttonColor,
            fixedSize: Size(MediaQuery.of(context).size.width * 0.90, MediaQuery.of(context).size.height * 0.1),
          ),),
    );
  }
}