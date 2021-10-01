import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';
import 'package:justrandom/screens/components/home_button.dart';

import 'home.dart';

class Dice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Column(
        children: [HomeButton(kDiceThemeColor),
        ],
      ),
    );
  }
}
