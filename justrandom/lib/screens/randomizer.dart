import 'package:flutter/cupertino.dart';

abstract class Randomizer extends StatelessWidget {
  late String name;
  late String description;
  late Color themeColor;

  void run();
}