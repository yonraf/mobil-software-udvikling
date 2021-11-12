import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:justrandom/constants.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';

class WheelOfFortune extends StatefulWidget implements Randomizer {

  WheelOfFortune();

  @override
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  String name = 'Wheel of Fortune';

  @override
  Color themeColor = kWheelThemeColor;

  @override
  _WheelOfFortuneState createState() => _WheelOfFortuneState();
}

class _WheelOfFortuneState extends State<WheelOfFortune> {
  StreamController<int> selected = StreamController();
  bool _spinCooldown = false;
  final inputController = TextEditingController();

  var inputs = [
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,

        body: Column(children: [
          TopBar(WheelOfFortune()),

          // WHEEL OF FORTUNE
          GestureDetector(
            child: Container(
              child: FortuneWheel(
                items: [
                  for (var input in inputs) FortuneItem(child: Text(input,))
                ],
                animateFirst: false,
                selected: selected.stream,
              ),
              height: MediaQuery.of(context).size.height * 0.35,
              margin: EdgeInsets.only(top: 40),
            ),
            onTap: () {
              cooldownControl();
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                width: 200,
                height: 70,
                child: TextField(
                  onSubmitted: (String str) {
                    addName();
                  },
                  controller: inputController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0, left: 10),
                    border: OutlineInputBorder(),
                    hintText: 'Enter a variable',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                margin: EdgeInsets.only(left: 10),
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    //AlertDialog(1);
                    addName();
                  },
                  child: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    primary: kWheelThemeColor,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView(
              children: [for (var input in inputs.reversed) InputField(input)],
            ),
          )
        ]));
  }


  @override
  void dispose() {
    inputController.dispose();
    selected.close();
    super.dispose();
  }

  void cooldownControl() {
    setState(() {
      if (!_spinCooldown) {
        var randValue = Random().nextInt(inputs.length);
        selected.add(randValue);
        setState(() => _spinCooldown = true);
        Timer(
            Duration(seconds: 5),
            () => setState(() {
                  AlertDialog(randValue);
                  _spinCooldown = false;
                }));
      }
    });
  }

  void addName() {
    var name = inputController.text;
    if (!name.isEmpty) {
      if (inputs.contains('')) {
        inputs.remove(inputs.elementAt(inputs.indexOf('')));
      }
      inputs.add(name);
      setState(() {});
      inputController.clear();
    }
  }

  Widget InputField(String input) {
    if (input.isNotEmpty) {
      return Container(
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(input),
            IconButton(
              onPressed: () {
                if (inputs.length > 2) {
                  this.inputs.remove(input);
                } else {
                  inputs[inputs.indexOf(input)] = "";
                }
                setState(() {});
              },
              icon: Icon(Icons.clear),
              color: Colors.redAccent,
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  void AlertDialog(int value) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            insetAnimationCurve: Curves.elasticInOut,
            title: Text(inputs[value] + " was chosen"),
            content: Text("Remove field or continue?"),
            actions: [
              CupertinoDialogAction(
                  child: Text(
                      "Remove",
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  onPressed: () {
                    if (inputs.length > 2) {
                      this.inputs.remove(inputs[value]);
                    } else {
                      inputs[value] = '';
                    }
                    Navigator.of(context).pop();
                    setState(() {});
                  }),
              CupertinoDialogAction(
                  child: Text("Continue"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {});
                  })
            ],
          );
        });
  }
}

