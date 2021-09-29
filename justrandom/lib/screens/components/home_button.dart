import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class HomeButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton (
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
        );
      }, child: Icon(Icons.arrow_back),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
        )
      ),
    );
  }
}