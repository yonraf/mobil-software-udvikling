import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';


import '../components/top_bar.dart';
import '../randomizer.dart';

class Dice extends StatefulWidget implements Randomizer {
  Dice();

  @override
  String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  String name = 'Dice Throw';

  @override
  Color themeColor = kDiceThemeColor;

  @override
  _DiceState createState() => _DiceState();
  
}

class _DiceState extends State<Dice> {

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

          // Action Knap
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Dice().themeColor,
              fixedSize: Size(MediaQuery.of(context).size.width * 0.90, MediaQuery.of(context).size.height * 0.1),
            ),
            onPressed: run,
            child: const Text(
              "Roll Dice",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Abel',
                fontWeight: FontWeight.w200,
              ),
            ),
          ),

          Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Dice().themeColor,
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.30, MediaQuery.of(context).size.height * 0.1),
                  ),
                  onPressed: run,
                  child: const Text(
                    "+",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Abel',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Colors.white),
                  child: Text(
                    '2',
                    style: const TextStyle(
                        fontFamily: 'Abel',
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        decoration: TextDecoration.none,
                        fontSize: 30
                    ),
                  )
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Dice().themeColor,
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.30, MediaQuery.of(context).size.height * 0.1),
                  ),
                  onPressed: run,
                  child: const Text(
                    "-",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Abel',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                )
              ],
            )
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
  
}
