import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justrandom/screens/home.dart';
import 'package:justrandom/fonts/Abel-Regular.ttf';
//import 'package:google_fonts/google_fonts.dart';


import 'constants.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Just Random',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      ),
      home: Home(),
    );
  }
}