import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;


class FormCard extends StatelessWidget {
  FormCard(this._usernameController, this._passwordController, this._nameError,
      this._passwordError);

  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final _nameError;
  final _passwordError;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 1),
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Login",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 40, color: colors.darkAccentColor)),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  hintText: "Enter username here",
                  hintStyle: GoogleFonts.poppins(color: colors.darkSecondaryTextColor),
                  label: Text("Username",
                      style: GoogleFonts.poppins(color: colors.darkSecondaryTextColor)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: colors.darkSecondaryTextColor, width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                           color: colors.successColor, width: 1.0)),
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //       color: colors.darkSecondaryTextColor, width: 1.0
                  //   ),
                  // ),
                  floatingLabelStyle:
                      GoogleFonts.poppins(color: colors.darkAccentColor),
                  errorText: _nameError,
                  labelStyle: GoogleFonts.poppins(fontSize: 14)),
              cursorColor: colors.darkPrimaryTextColor,
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password here",
                  hintStyle: GoogleFonts.poppins(color: colors.darkSecondaryTextColor),
                  focusColor: Color(0xffF5A06D),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: colors.darkSecondaryTextColor, width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: colors.successColor, width: 1.0)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colors.successColor, width: 1.0
                    ),
                  ),
                  label: Text("Password",
                      style: GoogleFonts.poppins(color: colors.darkSecondaryTextColor)),
                  floatingLabelStyle:
                      GoogleFonts.poppins(color: colors.darkSecondaryTextColor),
                  errorText: _passwordError,
                  labelStyle: GoogleFonts.poppins(fontSize: 14.0,color: colors.darkAccentColor),
                )),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}