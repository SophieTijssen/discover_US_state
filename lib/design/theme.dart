import 'package:flutter/material.dart';

Color background = Colors.white60;
Color primaryColor = Colors.indigoAccent;
Color focusBackground = Colors.blue;
Color textWhite = Colors.white;
Color textBlack = Colors.black;
Color headerColorBlack = Colors.black87;
Color iconColor = Colors.black38;

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  fontFamily: 'Roboto',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 46.0, fontWeight: FontWeight.bold, color: primaryColor),
    headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: headerColorBlack),
    headline3: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: textWhite),
    bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: textBlack),
    bodyText2: TextStyle(fontSize: 18.0, color: textBlack),
  ),
);