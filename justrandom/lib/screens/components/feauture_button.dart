import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../randomizer.dart';


class FeatureButton extends StatelessWidget {
  FeatureButton(this.randomizer);
  Randomizer randomizer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
      child : ElevatedButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => this.randomizer),
          );
        }, child: Text(
          this.randomizer.name,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.04,
          fontFamily: 'Abel',
          fontWeight: FontWeight.w200,
        ),
      ),
          style: ElevatedButton.styleFrom(
            primary: this.randomizer.themeColor,
            fixedSize: Size(MediaQuery.of(context).size.width * 0.90, MediaQuery.of(context).size.height * 0.1),
          ),),
    );
  }
}