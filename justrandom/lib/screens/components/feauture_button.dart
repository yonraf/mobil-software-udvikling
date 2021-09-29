import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';

import '../dice.dart';
import '../home.dart';

class FeatureButton extends StatelessWidget {
  FeatureButton(this.buttonText);
  var buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child : ElevatedButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dice()),
          );
        }, child: Text(
          this.buttonText,
        style: TextStyle(fontSize: 15),
      ),
          style: ElevatedButton.styleFrom(
            primary: kPrimaryColor,
            fixedSize: Size(MediaQuery.of(context).size.width * 0.90, MediaQuery.of(context).size.height * 0.1)
          ),),
    );
  }
}