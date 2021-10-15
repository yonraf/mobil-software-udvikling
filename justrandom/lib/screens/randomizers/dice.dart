import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';

class Dice extends StatefulWidget {
  Dice();

  @override
  _DiceState createState() => _DiceState();
  
}

class _DiceState extends State<Dice> implements Randomizer{
  @override
  String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  String name = 'Dice Throw';

  @override
  Color themeColor = kDiceThemeColor;

  var imageArray = ["one.png", "two.png", "three.png", "four.png", "five.png", "six.png"];
  int randomIntForDiceOne = Random().nextInt(6);
  int randomIntForDiceTwo = Random().nextInt(6);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          TopBar(Dice()),
          Text(
            "You Rolled: " + (randomIntForDiceOne + randomIntForDiceTwo + 2).toString(),
            style: const TextStyle(
                fontFamily: 'Abel',
                color: Colors.black,
                fontWeight: FontWeight.w200,
                decoration: TextDecoration.none,
                fontSize: 28
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/"+imageArray[randomIntForDiceOne], height: 150, width: 150,),
                Image.asset("assets/"+imageArray[randomIntForDiceTwo], height: 150, width: 150,)
              ],
            ),
          ),
          ElevatedButton(onPressed: run,
            child: const Text("Roll Dice"),
          )
          /*Padding(
            padding: const EdgeInsets.only(top: 60),
            child: ElevatedButton(onPressed: changeImage,
                child: const Text("Roll Dice"),
            ),
          )*/
        ],
      ),
    );
  }

  @override
  void run() {
    setState(() {
      randomIntForDiceOne = Random().nextInt(6);
      randomIntForDiceTwo = Random().nextInt(6);
    });
  }
  
}
