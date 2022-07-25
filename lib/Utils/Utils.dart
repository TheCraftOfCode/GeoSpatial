import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:oktoast/oktoast.dart';
import '../main.dart';
import 'Constants.dart';
import 'package:http/http.dart' as http;

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

logout(context) async {
  await storage.delete(key: JWT_STORAGE_KEY);
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Login()),
      (Route<dynamic> route) => false);
}

logoutDialog(context) {
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
            logout(context);
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

displayDialog(context,
    {required String title,
    required String subTitle,
    required VoidCallback positiveFunction,
    required VoidCallback negativeFunction}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: colors.darkScaffoldColor,
      title: Text(
        title,
        style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
      ),
      content: Text(
        subTitle,
        style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'No',
            style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
          ),
          onPressed: negativeFunction,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: colors.darkAccentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          child:
              Text('Yes', style: TextStyle(color: colors.darkPrimaryTextColor)),
          onPressed: positiveFunction,
        ),
      ],
    ),
  );
}

Future<bool> deleteRecord(var data, String node, context) async {
  String url = NETWORK_ADDRESS;
  var body = json.encode(data);

  var progressContext;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      progressContext = context;
      return WillPopScope(
          child: Dialog(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: CircularProgressIndicator(),
                  ),
                  new Text(
                    "Deleting Record",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          onWillPop: () async => false);
    },
  );

  var jwt = await jwtToken;

  var res = await http
      .post(Uri.https(url, node),
          headers: {"Content-Type": "application/json", "user-auth-token": jwt},
          body: body)
      .timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      // Time has run out, do what you wanted to do.
      return http.Response(
          'Server Timed out!', 408); // Request Timeout response status code
    },
  );
  Navigator.of(progressContext!, rootNavigator: true).pop();
  if (res.statusCode != 200) {
    showToast(res.body);
    return false;
  }
  return true;
}
