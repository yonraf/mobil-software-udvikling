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
      'Choose the number of dices you wish to throw - and Roll Dice!';

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

  int diceCount = 1;
  var diceNumbers = [Random().nextInt(6)];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          TopBar(Dice()),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Text(
              "You Rolled: " +
                  (diceNumbers.reduce((a, b) => a + b) + diceCount).toString(),
              style: kTextStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var number in diceNumbers)
                Image.asset(
                  "assets/" + imageArray[number],
                  height: 150,
                  width: 150 / diceCount + 40,
                )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // +- Button
                  Container(
                      // mellem-rum mellem knapperne
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Dice().themeColor),
                      constraints: BoxConstraints.expand(
                          width: screenWidth * 0.90,
                          height: screenHeight * 0.1),
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Dice().themeColor,
                              fixedSize:
                                  Size(screenWidth * 0.3, screenHeight * 0.1),
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
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.1),
                              child: Text(
                                "$diceCount",
                                style: kTextStyle,
                              )),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Dice().themeColor,
                              fixedSize:
                                  Size(screenWidth * 0.3, screenHeight * 0.1),
                            ),
                            onPressed: incrementDice,
                            child: const Text(
                              "+",
                              style: kButtonTextStyle,
                            ),
                          ),
                        ],
                      )),

                  // Roll Dice Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Dice().themeColor,
                      fixedSize: Size(screenWidth * 0.90, screenHeight * 0.1),
                    ),
                    onPressed: run,
                    child: const Text(
                      "Roll Dice",
                      style: kButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void run() {
    setState(() {
      // clear all previous diceNumbers
      diceNumbers.clear();

      // based on diceCount we roll new diceNumbers
      for (var i = 0; i < diceCount; i++) {
        diceNumbers.add(Random().nextInt(6));
      }
    });
  }

  void incrementDice() {
    if (diceCount > 3) {
      return;
    }
    setState(() {
      diceCount++;
      diceNumbers.add(Random().nextInt(6));
    });
  }

  void decrement() {
    if (diceCount < 2) {
      return;
    }
    setState(() {
      diceCount--;
      diceNumbers.removeLast();
    });
  }
}
