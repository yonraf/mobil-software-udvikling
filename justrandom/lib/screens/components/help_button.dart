
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/screens/randomizer.dart';

import '../randomizers/home.dart';

class HelpButton extends StatelessWidget {
  HelpButton(this.randomizer);
  Randomizer randomizer;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
          icon: Icon(Icons.help_outline),
          color: randomizer.themeColor,
          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          hoverColor: Colors.transparent,
          tooltip: "Help",
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) =>  AlertDialog(
                    title: Text(randomizer.name+ " - Help"),
                    content: new Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            constraints: BoxConstraints(minWidth: 150, maxWidth: 250),
                            child: Text(randomizer.description)),
                      ],

                    )
                ));
          },)
    );
  }


}