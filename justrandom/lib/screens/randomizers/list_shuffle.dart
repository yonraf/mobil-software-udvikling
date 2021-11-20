import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/constants.dart';

import 'package:justrandom/screens/randomizer.dart';

import '../components/top_bar.dart';

class ListShuffle extends StatefulWidget implements Randomizer {
  ListShuffle();

  @override
  String description = 'Shuffle list will take a list of elements and shuffle '
      'it random.\n\nSo first of all, type in elements in the input field.'
      'Then shuffle.\n\nHave fun!';

  @override
  String name = 'Shuffle List';

  @override
  Color themeColor = kShuffleThemeColor;
  Color primary = kPrimaryColor;
  Color textColor = kTextColor;

  @override
  _ListShuffleState createState() => _ListShuffleState();
}

class _ListShuffleState extends State<ListShuffle> {
  StreamController<int> selected = StreamController();
  final inputController = TextEditingController();
  late FocusNode focusNode;
  late String shuffleText;

  List<String> inputs = <String>[];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                onSubmitted: (String str) {
                  addElement();
                },
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
                  primary: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              for (var element in inputs.reversed) inputField(element),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ListShuffle().themeColor,
            fixedSize: Size(screenWidth * 0.90, screenHeight * 0.1),
          ),
          onPressed: run,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Shuffle",
              style: kButtonTextStyle,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 25)),
      ]),
    );
  }

  void addElement() {
    var input = inputController.text;
    if (input.isNotEmpty && input.replaceAll(RegExp(r'(\s*)'), '').length > 0) {
      if (inputs.where((element) => element == '') == true) {
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
    if (input.isNotEmpty && input.contains('')) {
      return Container(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              input,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextColor,
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
    } else {
      return Container();
    }
  }

  Widget dialogInput(int num, String input) {
    if (input.isNotEmpty) {
      return Container(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              num.toString() + ': ',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            Text(
              input,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: kTextColor,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  void _showDialog() {
    int num = 1;
    inputs.shuffle();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text('Shuffled list'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Divider(color: kShuffleThemeColor),
                ListBody(
                  children: [
                    for (var element in inputs) dialogInput(num++, element),
                    const Divider(color: kShuffleThemeColor),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
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
