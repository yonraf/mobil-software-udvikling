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

  WheelOfFortune();

  @override
  _WheelOfFortuneState createState() => _WheelOfFortuneState();
}

class _WheelOfFortuneState extends State<WheelOfFortune> {

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

  //StreamController<int> controller = StreamController<int>();

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
            items: [for (var input in inputs) FortuneItem(child: Text(input))],
            animateFirst: false,
            selected: selected.stream,
          ),
          height: 300,
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
              onSubmitted: (String str) { addName();},
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
                addName();
              },
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
            ),
          )
        ],
      ),
      Expanded(
        child: ListView(
          children: [for (var input in inputs.reversed) inputField(input)],
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
        selected.add(Random().nextInt(inputs.length));
        setState(() => _spinCooldown = true);
        Timer(
            Duration(seconds: 5), () => setState(() => _spinCooldown = false));
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

  Widget inputField(String input) {
    if (input.isNotEmpty) {
      return Container(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(input),
            IconButton(
              onPressed: () {
                if (inputs.length > 2) {
                  this.inputs.remove(input);
                  setState(() {});
                }
              },
              icon: Icon(Icons.clear),
              color: Colors.redAccent,
            )
          ],
        ),
      );
    } else {return Container();}
    }
}

