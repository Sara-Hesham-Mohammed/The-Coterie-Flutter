import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  late double screenWidth;
  late double screenHeight;
  late double blockWidth;
  late double blockHeight;

  Responsive(this.context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
  }

  double wp(double percent) => blockWidth * percent;
  double hp(double percent) => blockHeight * percent;
}