import 'package:flutter/material.dart';

abstract class ScreenMeasurements{
  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  static double height(BuildContext context) => MediaQuery.of(context).size.height;
}