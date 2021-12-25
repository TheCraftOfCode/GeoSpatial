import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

class darkTheme{
  static ThemeData get DarkTheme{
    return ThemeData(
      fontFamily: 'Poppins',
        primaryColor: Colors.white,
        scaffoldBackgroundColor: colors.darkScaffoldColor,

        textTheme: TextTheme(
            headline1: GoogleFonts.poppins(color: Colors.white, fontSize: 40,fontWeight: FontWeight.w200),
            bodyText1: GoogleFonts.poppins(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w100),
            bodyText2: GoogleFonts.poppins(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),
            button: GoogleFonts.poppins(color: Color(0xff43282C))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffc1c1c1),
              elevation: 10.0,
              onPrimary: Color(0xff43282C),
              padding: EdgeInsets.all(10),
            )
        ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: colors.darkAccentColor, width: 1.0)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: colors.darkAccentColor, width: 1.0)),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
              color: colors.darkAccentColor, width: 1.0
          ),
        ),
        contentPadding: EdgeInsets.all(20.0),
        fillColor: colors.darkScaffoldColor,
        labelStyle: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
        floatingLabelStyle: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
        hintStyle: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
      ),

    );

  }
}