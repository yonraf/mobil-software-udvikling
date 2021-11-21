import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justrandom/constants.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';
import 'dart:math';

class RandomNumber extends StatefulWidget implements Randomizer {
  @override
  String description =
      'The random number generator utilizes a given interval and plugs out a random number.';

  @override
  String name = 'Number Generator';

  @override
  Color themeColor = kNumberThemeColor;

  RandomNumber();

  @override
  _RandomNumberState createState() => _RandomNumberState();
}

class _RandomNumberState extends State<RandomNumber> {
  String randomNumber = 'Awaiting Input ...';
  var minNumber = TextEditingController();
  var maxNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kBackgroundColor,
        body: Column(children: [
          TopBar(RandomNumber()),
          Expanded(
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 100, bottom: 50),
                    child: Text(
                      '$randomNumber',
                      style: kTextStyle,
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          Text("Minimum number"),
                          Container(
                              margin: const EdgeInsets.all(10.0),
                              decoration: new BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: new Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  )),
                              width: 150,
                              child: new TextField(
                                //decoration: new InputDecoration(labelText: "Minimum number", ),
                                textInputAction: TextInputAction.next,
                                controller: minNumber,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ], // Only numbers can be entered
                              ))
                        ],
                      ),
                      Column(children: [
                        Text(
                          "Maximum number",
                          textAlign: TextAlign.start,
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 150,
                            decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: new Border.all(
                                  color: Colors.black,
                                  width: 0.5,
                                )),
                            child: new TextField(
                              controller: maxNumber,
                              onSubmitted: (String str) {
                                run();
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ], // Only numbers can be entered
                            ))
                      ])
                    ]),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          height: 75.0,
                          width: 150.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                            ),
                            child: Text('Clear'),
                            onPressed: clear,
                          )),
                      Container(
                        padding: EdgeInsets.all(25.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: RandomNumber().themeColor,
                            fixedSize: Size(
                                screenWidth * 0.90,
                                screenHeight * 0.1),
                          ),
                          onPressed: run,
                          child: Text(
                            "Generate",
                            style: kButtonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
          ),
        ]));
  }

  void run() {
    setState(() {
      int min = int.parse(minNumber.text);
      int max = int.parse(maxNumber.text);
      if (min >= max) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Oops..."),
            content: Text("You need to enter a valid number."),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  clear();
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      } else {
        int random = min + Random().nextInt((max - min) + 1);
        randomNumber = random.toString();
        print(randomNumber);
      }
    });
  }

  void clear() {
    maxNumber.clear();
    minNumber.clear();
  }
}
