import 'package:flutter/material.dart';

final kTheme = ThemeData(
  primaryColor: Colors.blue,
  accentColor: Colors.white,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.accent,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
