import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';

class Dice extends StatefulWidget implements Randomizer {
  Dice();

  @override
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  String name = 'Dice Throw';

  @override
  Color themeColor = kDiceThemeColor;

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  var imageArray = [
    "one.png",
    "two.png",
    "three.png",
    "four.png",
    "five.png",
    "six.png"
  ];

  int randomIntForDiceOne = Random().nextInt(6);
  int randomIntForDiceTwo = Random().nextInt(6);
  int diceCount = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          TopBar(Dice()),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              "You Rolled: " +
                  (randomIntForDiceOne + randomIntForDiceTwo + 2).toString(),
              style: const TextStyle(
                  fontFamily: 'Abel',
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                  fontSize: 28),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 170),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/" + imageArray[randomIntForDiceOne],
                  height: 150,
                  width: 150,
                ),
                Image.asset(
                  "assets/" + imageArray[randomIntForDiceTwo],
                  height: 150,
                  width: 150,
                )
              ],
            ),
          ),

          // plus minus button
          Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Dice().themeColor),
              constraints: BoxConstraints.expand(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.1
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Dice().themeColor,
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.3,
                          MediaQuery.of(context).size.height * 0.1),
                    ),
                    onPressed: decrement,
                    child: const Text(
                      "-",
                      style: kButtonTextStyle,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white),
                      constraints: BoxConstraints.expand(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.1
                      ),
                      child: Text(
                        "$diceCount",
                        style: const TextStyle(
                            fontFamily: 'Abel',
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            decoration: TextDecoration.none,
                            fontSize: 30),
                      )),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Dice().themeColor,
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.3,
                          MediaQuery.of(context).size.height * 0.1),
                    ),
                    onPressed: incrementDice,
                    child: const Text(
                      "+",
                      style: kButtonTextStyle,
                    ),
                  )
                ],
              )),

          // Action Knap
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Dice().themeColor,
              fixedSize: Size(MediaQuery.of(context).size.width * 0.90,
                  MediaQuery.of(context).size.height * 0.1),
            ),
            onPressed: run,
            child: const Text(
              "Roll Dice",
              style: kButtonTextStyle,
            ),
          )
        ],
      ),
    );
  }

  void run() {
    setState(() {
      randomIntForDiceOne = Random().nextInt(6);
      randomIntForDiceTwo = Random().nextInt(6);
    });
  }

  void incrementDice() {
    if (diceCount > 3) {
      return;
    }
    setState(() {
      diceCount++;
    });
  }

  void decrement() {
    if (diceCount < 2) {
      return;
    }
    setState(() {
      diceCount--;
    });
  }

}
