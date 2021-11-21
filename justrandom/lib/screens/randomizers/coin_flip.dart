import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';

class CoinFlip extends StatefulWidget implements Randomizer {
  @override
  String description = 'Flip the coin to make a decision between two options';

  @override
  String name = 'Coin Flip';

  @override
  Color themeColor = kCoinThemeColor;

  CoinFlip();

  @override
  _CoinFlipState createState() => _CoinFlipState();
}

class _CoinFlipState extends State<CoinFlip> {
  bool isHeads = true;
  bool imageShiftCooldown = false;

  double angle = 0;
  int randomValue = 0;

  bool _flipCooldown = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          TopBar(CoinFlip()),
          Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05)),
          Center(
            heightFactor: 1,
            child:TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: angle),
                duration: Duration(seconds: 2),
                builder: (BuildContext context, double val, __) {
                  if(val % pi > 1.57 && !imageShiftCooldown) {
                    isHeads = !isHeads;
                    imageShiftCooldown = true;
                  } else if (val % pi < 1.57) {
                    imageShiftCooldown = false;
                  }
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(val),
                    child: Container(
                        width: 300,
                        height: 300,
                        child: isHeads
                            ? Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/heads.png")),
                          ),
                        )
                            : Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/tails.png")),
                          ),
                        )),
                  );
                }),
          )
          ,
          Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 25, top: 10),
                child : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: CoinFlip().themeColor,
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.1),
                  ),
                  onPressed: () {
                    if (!_flipCooldown) {
                      _flipCooldown = true;
                      flipCoin();
                      Timer(Duration(milliseconds: 2500), () {
                        _flipCooldown = false;
                      });
                    }
                  },
                  child: Text(
                    "FLIP",
                    style: kButtonTextStyle,
                  ),

                ),
              )
          ),
        ],
      ),
    );
  }

  void flipCoin() {

    setState(() {
      randomValue = 6 + Random().nextInt(8-6);
      angle = (randomValue * pi) + angle;
    });
  }


}
