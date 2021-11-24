import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

class darkTheme{
  static ThemeData get DarkTheme{
    return ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color(0xff1B0000),
        textTheme: TextTheme(
            headline1: GoogleFonts.poppins(color: Colors.white, fontSize: 40,fontWeight: FontWeight.w200),
            bodyText1: GoogleFonts.poppins(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w100),
            bodyText2: GoogleFonts.poppins(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),
            button: GoogleFonts.poppins(color: Color(0xff43282C))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffE9C9CC),
              elevation: 10.0,
              onPrimary: Color(0xff43282C),
              side: BorderSide(color: Color(0xff43282C),width: 2,style: BorderStyle.solid),
              padding: EdgeInsets.all(10),
            )
        ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(10),
        labelStyle: GoogleFonts.poppins(),
        floatingLabelStyle: GoogleFonts.poppins(color: colors.darkScaffoldColor),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors.darkAccentColor)),
        hintStyle: GoogleFonts.poppins(),
      ),
    );
  }
}