import 'package:flutter/material.dart';
import 'package:geo_spatial/Login.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: MyApp(),
      ),
    ),
  );
}

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xff5EAAA8),
  canvasColor: Color(0xffF7F3E9),
  accentColor: Color(0xffF05945),
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
  buttonColor: Color(0xffA3D2CA),
  backgroundColor: Color(0xffF7F3E9),
  hintColor: Color(0xff5EAAA8),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
