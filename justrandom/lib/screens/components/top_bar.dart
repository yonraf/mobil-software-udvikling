import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/screens/components/home_button.dart';


class TopBar extends StatelessWidget {
  TopBar(this.buttonColor, this.buttonText);
  Color buttonColor;
  var buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical : MediaQuery.of(context).size.height * 0.06, horizontal: 5),
      child: Row(
        children: [
          HomeButton(buttonColor),
          Text(
            buttonText,
            style: TextStyle(
              fontFamily: 'Abel',
              color: Colors.black,
              fontWeight: FontWeight.w200,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}