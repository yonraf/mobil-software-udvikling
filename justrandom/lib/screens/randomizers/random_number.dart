import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justrandom/constants.dart';

import '../components/top_bar.dart';
import '../randomizer.dart';
import 'dart:math';

class RandomNumber extends StatefulWidget implements Randomizer {
  @override
  String description = 'The random number generator utilizes a given interval and plugs out a random number.';

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
                          Container(
                              margin: const EdgeInsets.all(50.0),

                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 50,0,0),
                                child: Text(
                                  '$randomNumber',
                                  style: TextStyle(
                                    fontFamily: 'Abel',
                                    color: kNumberThemeColor,
                                    fontWeight: FontWeight.w200,
                                    decoration: TextDecoration.none,
                                    fontSize: 40,
                                  ),
                                ),
                              )
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget> [
                                Column(
                                  children: [
                                    Text(
                                        "Minimum number"
                                    ),
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
                                          controller: minNumber,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                          ], // Only numbers can be entered
                                        )
                                    )

                                  ],
                                )

                                ,
                                Column(
                                    children: [
                                      Text("Maximum number",
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
                                              )
                                          ),
                                          child:new TextField(
                                            controller: maxNumber,
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter.digitsOnly
                                            ], // Only numbers can be entered
                                          )
                                      )
                                    ]
                                )


                              ]
                          )
                          ,  Container(
                              padding: EdgeInsets.all(20.0),
                              height: 75.0,
                              width: 150.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                ),
                                child: Text('Clear'),
                                onPressed: clear
                                ,
                              )
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget> [
                                Container(
                                    padding: EdgeInsets.all(20.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: RandomNumber().themeColor,
                                        fixedSize: Size(MediaQuery.of(context).size.width * 0.3, MediaQuery.of(context).size.height * 0.1),

                                      ),

                                      child: Text('Generate',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'Abel',
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                      onPressed: run
                                      ,
                                    )
                                )

                              ],
                            ),
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
      if(min >= max){
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
        int random = min + Random().nextInt((max-min)+1);
        randomNumber = random.toString();
        print(randomNumber);
      }

    }

    );
  }
  void clear(){
    maxNumber.clear();
    minNumber.clear();
  }
}