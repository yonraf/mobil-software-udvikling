import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';

import 'components/top_bar.dart';

class WheelOfFortune extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          TopBar(kWheelThemeColor, "Wheel of Fortune")
        ],
      ),
    );
  }
}