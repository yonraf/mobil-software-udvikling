import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justrandom/constants.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';
import 'dart:math';

class RandomNumber extends StatefulWidget implements Randomizer {
  @override
  String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  String name = 'Number Generator';

  @override
  Color themeColor = kNumberThemeColor;



  RandomNumber();

  @override
  _RandomNumberState createState() => _RandomNumberState();
}



class _RandomNumberState extends State<RandomNumber> {
  String randomNumber = 'Random number pending';
  var minNumber = TextEditingController();
  var maxNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: Container(
          color: kBackgroundColor,
          child: Column(
              children: [
                TopBar(RandomNumber()),
                Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Randomly Generated number: $randomNumber',
                          style: TextStyle(
                            fontFamily: 'Abel',
                            color: Colors.red,
                            fontWeight: FontWeight.w200,
                            decoration: TextDecoration.none,
                            fontSize: 20,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              child: Text('Randomize'),
                              onPressed: run
                              ,
                            )
                        )
                        ,
                        new TextField(
                          decoration: new InputDecoration(labelText: "Minimum number"),
                          controller: minNumber,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                        ),
                        new TextField(
                          decoration: new InputDecoration(labelText: "Maximum number"),
                          controller: maxNumber,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                        ),
                        Container(
                            padding: EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              child: Text('Clear'),
                              onPressed: clear
                              ,
                            )
                        )
                      ],

                    )
                ),
              ]
          )
      )
    );

  }

  void run (){
    setState(() {
      int min = int.parse(minNumber.text);
      int max = int.parse(maxNumber.text);
      int random = min + Random().nextInt((max-min)+1);
      randomNumber = random.toString();
      print(randomNumber); // Need to do exception handling.
        }
    );
  }
  void clear(){
      maxNumber.clear();
      minNumber.clear();
  }
}