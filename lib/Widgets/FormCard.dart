import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
                style: GoogleFonts.poppins(fontWeight: FontWeight.w200,
                    fontSize: 40, color: Color(0xffF5A06D))),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  hintText: "Enter username here",
                  hintStyle: GoogleFonts.poppins(color: Color(0xffcec7c3)),
                  label: Text("Username",
                      style: GoogleFonts.poppins(color: Color(0xffF5A06D))),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffF5A06D), width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffF5A06D), width: 1.0)),
                  border: UnderlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xffF5A06D), width: 1.0
                    ),
                  ),
                  floatingLabelStyle:
                      GoogleFonts.poppins(color: Color(0xffF5A06D)),
                  errorText: _nameError,
                  labelStyle: GoogleFonts.poppins(fontSize: 14)),
              cursorColor: Color(0xffF5A06D),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password here",
                  hintStyle: GoogleFonts.poppins(color: Color(0xffcec7c3)),
                  focusColor: Color(0xffF5A06D),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffF5A06D), width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffF5A06D), width: 1.0)),
                  border: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffF5A06D), width: 1.0
                    ),
                  ),
                  label: Text("Password",
                      style: GoogleFonts.poppins(color: Color(0xffF5A06D))),
                  floatingLabelStyle:
                      GoogleFonts.poppins(color: Color(0xffF5A06D)),
                  errorText: _passwordError,
                  labelStyle: GoogleFonts.poppins(fontSize: 14.0),
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
