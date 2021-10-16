import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xff5EAAA8),
  canvasColor: Color(0xffF7F3E9),
  scaffoldBackgroundColor: Color(0xffF7F3E9),
  cardColor: Colors.white,
  focusColor: Color(0xff5EAAA8),
  hoverColor: Color(0xff5EAAA8),
  highlightColor: Color(0xff5EAAA8),
  disabledColor: Colors.grey.shade200,
  buttonTheme: ButtonThemeData(
    minWidth: 200,
    height: 50,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
  ),
  backgroundColor: Color(0xffF7F3E9),
  hintColor: Color(0xff5EAAA8), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xffF05945)),
);