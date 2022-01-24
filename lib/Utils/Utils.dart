import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import '../main.dart';
import 'Constants.dart';

Future<String> get jwtToken async {
  var jwt = await storage.read(key: JWT_STORAGE_KEY);
  if (jwt == null) return "";
  return jwt;
}

Future<String> get getUserData async {
  var userData = await storage.read(key: USER_DATA_KEY);
  if (userData == null) return "";
  return userData;
}

Future<String> get getUserID async {
  var userData = await getUserData;
  var dataJson = json.decode(userData);
  return dataJson[0]["username"];
}

Future<String> get getUserName async {
  var storedUserId = await storage.read(key: USER_ID_KEY);

  if (storedUserId == null) return "";
  return storedUserId;
}

logout(context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: colors.darkScaffoldColor,
      title: Text(
        "Are you sure?",
        style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
      ),
      content: Text(
        "You will be logged out",
        style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'No',
            style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: colors.darkAccentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          child:
              Text('Yes', style: TextStyle(color: colors.darkPrimaryTextColor)),
          onPressed: () async {
            await storage.delete(key: JWT_STORAGE_KEY);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (Route<dynamic> route) => false);
          },
        ),
      ],
    ),
  );
}

closePage(context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: colors.darkScaffoldColor,
      title: Text(
        "Are you sure?",
        style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
      ),
      content: Text(
        "All unsaved changes will be lost.",
        style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'No',
            style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: colors.darkAccentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          child: Text(
            'Yes',
            style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    ),
  );
}
