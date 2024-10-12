import 'package:flutter/material.dart';

class CustomSpace{
  CustomSpace._();

  static Widget vertical({double ? space}){
    return SizedBox(
      height: space ?? 16,
    );
  }

  static Widget horizontal({double ? space}){
    return SizedBox(
      width: space ?? 16,
    );
  }
}