import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';

import 'package:justrandom/screens/randomizer.dart';

import '../components/top_bar.dart';

class ListShuffle extends StatefulWidget implements Randomizer {

  ListShuffle();
  
  @override
  String description = 'Shuffle list will take a list of elements and shuffle it random';

  @override
  String name = 'Shuffle List';

  @override
  Color themeColor = kShuffleThemeColor;

  @override
  _ListShuffleState createState() =>  _ListShuffleState();

}

class _ListShuffleState extends State<ListShuffle> {
  StreamController<int> selected = StreamController();
  final inputController = TextEditingController();
  late FocusNode focusNode;
  late String shuffleText;

  List<String> inputs = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
          TopBar(ListShuffle()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                width: 300,
                height: 70,
                  child: TextField(
                    autofocus: true,
                    onSubmitted: (String str) { addElement();},
                    controller: inputController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0, left: 10),
                      border: OutlineInputBorder(),
                      hintText: 'Enter element',
                    ),
                  ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                margin: EdgeInsets.only(left: 10),
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    addElement();
                  },
                  child: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    primary: kShuffleThemeColor,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView(
              children: [for (var element in inputs.reversed) inputField(element)],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ListShuffle().themeColor,
              fixedSize: Size(MediaQuery.of(context).size.width * 0.90, MediaQuery.of(context).size.height * 0.1),
            ),
            onPressed: run,
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Shuffle",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Abel',
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
        const Padding(
            padding: EdgeInsets.only(bottom: 30)
        ),
        ]
      ),
    );

  }

  void addElement() {
    var input = inputController.text;
    if (input.isNotEmpty) {
      if (inputs.where((element) => element == '') == true) {
        //inputs.remove(inputs.elementAt(inputs.indexOf(''));
        inputs.removeWhere((element) => element == '');
      }
      inputs.add(input);
      print('element added');
      setState(() {});
      inputController.clear();
    }
  }

  @override
  void dispose() {
    inputController.dispose();
    selected.close();
    super.dispose();
  }

  Widget inputField(String input) {
    if (input.isNotEmpty) {
      return Container(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              input,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                ),
            ),
            IconButton(
              onPressed: () {
                if (inputs.isNotEmpty) {
                  this.inputs.remove(input);
                  print('element removed');
                  setState(() {});
                }
              },
              icon: Icon(Icons.clear),
              color: Colors.redAccent,
            ),
          ],
        ),
      );
    } else {return Container();}
  }

  void resetShuffleText(){
    shuffleText = '';
  }

  void _showDialog() {
    resetShuffleText();
    inputs.shuffle();
    int num = 1;

    for (var element in inputs) {
      shuffleText += (num.toString() + ':    ' + element + '\n');
      num++;
    }

    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text('Shuffled list'),
          content: Text(shuffleText),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void run() {
    setState(() {
      _showDialog();
    });
  }

}