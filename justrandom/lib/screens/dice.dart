import 'package:flutter/cupertino.dart';
import 'package:justrandom/constants.dart';
import 'package:justrandom/screens/components/home_button.dart';

class Dice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeButton(),
      decoration: BoxDecoration(
        color: kPrimaryColor,
      ),
    );
  }

}