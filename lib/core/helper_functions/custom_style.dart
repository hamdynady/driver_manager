import 'package:flutter/material.dart';

TextStyle customStyle(
    {required Color textColor,
    double fontSize = 16.0,
    FontWeight weight = FontWeight.normal}) {
  return TextStyle(
    fontSize: fontSize,
    color: textColor,
    fontWeight: weight,
  );
}
