import 'dart:convert';
import 'package:geo_spatial/Utils/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Constants/Constants.dart';
import 'package:geo_spatial/Screens/Home.dart';
import 'package:geo_spatial/Widgets/LoginFormCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:geo_spatial/Utils/Globals.dart' as globals;

final storage = FlutterSecureStorage();

class Login extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var _nameError = null;
  var _passwordError = null;
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  String _validateUserName(String username) {
    if (username.isEmpty)
      return 'Please enter username';
    else if (username.length != 16)
      return 'Username has to be 16 characters long';
    else
      return '';
  }

  String _validatePassword(String password) {
    if (password.isEmpty)
      return 'Please enter password';
    else
      return '';
  }

  Future<http.Response> _makeLoginRequest(
      String username, String password) async {
    String url = NETWORK_ADDRESS;
    var body = json.encode({"username": username, "password": password});

    var res = await http.post(Uri.http(url, '/api/login'),
        headers: {"Content-Type": "application/json"}, body: body);
    return res;
  }

  _login() async {
    var username = _usernameController.text;
    var password = _passwordController.text;

    var userNameValidationString = _validateUserName(username);

    setState(() {
      if (userNameValidationString == '')
        _nameError = null;
      else
        _nameError = userNameValidationString;
    });

    var userPasswordValidationString = _validatePassword(password);

    setState(() {
      if (userPasswordValidationString == '')
        _passwordError = null;
      else
        _passwordError = userPasswordValidationString;
    });

    if (_nameError == null && _passwordError == null) {
      http.Response loginResponse = await _makeLoginRequest(username, password);
      if (loginResponse.statusCode != 200) {
        setState(() {
          _nameError = loginResponse.body;
          _passwordError = loginResponse.body;
        });
      } else {
        storage.write(key: "jwt", value: loginResponse.body);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()),
            (Route<dynamic> route) => false);
      }
    }
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: colors.darkAccentColor)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: colors.darkAccentColor),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 120,
          height: 1.0,
          color: Colors.white70.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.darkScaffoldColor,
      body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/Illustration.png"),fit: BoxFit.cover)
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.48,
                    ),
                    FormCard(_usernameController, _passwordController,
                        _nameError, _passwordError),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 12.0,
                            ),
                            GestureDetector(
                              onTap: _radio,
                              child: radioButton(_isSelected),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text("Remember me",
                                style: GoogleFonts.poppins(
                                    color: colors.darkAccentColor, fontSize: 14.0))
                          ],
                        ),
                        InkWell(
                          child: Container(
                            width: 100,
                            height: 45,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xfff54b64),
                                Color(0xfff78361),
                              ]),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: (){ Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Home()),
                                );},
                                child: Center(
                                  child: Text("SIGN IN",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 18,
                                          letterSpacing: 1.0)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
