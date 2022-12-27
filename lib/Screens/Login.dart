import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Utils/Constants.dart';
import 'package:geo_spatial/Screens/Home.dart';
import 'package:geo_spatial/Utils/colors.dart' as colors;
import 'package:geo_spatial/Widgets/LoginFormCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

import '../main.dart';

class Login extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var _nameError = null;
  var _passwordError = null;
  bool _isSelected = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    data() async {
      var data = await storage.read(key: REMEMBER_ME_KEY);
      if (data != null) {
        _isSelected = data == "true";
      }
      setState(() {});
    }

    data();
  }

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
    storage.write(key: REMEMBER_ME_KEY, value: _isSelected.toString());
  }

  String _validateUserName(String username) {
    if (username.isEmpty)
      return 'Please enter username';
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

    var res = await http
        .post(Uri.http(url, '/api/login'),
            headers: {"Content-Type": "application/json"}, body: body)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Server Timed out!', 408); // Request Timeout response status code
      },
    );

    return res;
  }

  Future<http.Response> _getUserDetails(String JWT) async {
    String url = NETWORK_ADDRESS;

    var res = await http.get(Uri.http(url, '/api/getUserData'), headers: {
      "Content-Type": "application/json",
      'user-auth-token': JWT
    }).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        showToast("Server Timed out!");
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    );

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
      try {
        http.Response loginResponse =
            await _makeLoginRequest(username, password);
        if (loginResponse.statusCode != 200) {
          setState(() {
            _nameError = loginResponse.body;
            _passwordError = loginResponse.body;
          });
        } else {
          try {
            http.Response userData = await _getUserDetails(loginResponse.body);
            if (userData.statusCode != 200) {
              showToast(
                  "Something went wrong, please check your network connection or try again later",
                  position: ToastPosition.center,
                  backgroundColor: colors.darkAccentColor);
            } else {
              storage.write(key: USER_DATA_KEY, value: userData.body);
              storage.write(key: JWT_STORAGE_KEY, value: loginResponse.body);
              storage.write(key: USER_ID_KEY, value: username);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false);
            }
          } catch (e) {
            debugPrint(e.toString());
            showToast(
                "Something went wrong, please check your network connection or try again later",
                position: ToastPosition.center,
                backgroundColor: colors.darkAccentColor);
          }
        }
      } catch (e) {
        debugPrint(e.toString());
        showToast(
            "Something went wrong, please check your network connection or try again later");
      }
    }
    setState(() {
      _isLoading = false;
    });
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
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: colors.darkAccentColor),
              )
            : Container(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colors.darkScaffoldColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SvgPicture.asset(
            "assets/svg/background.svg",
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.48,
                  ),
                  FormCard(_usernameController, _passwordController, _nameError,
                      _passwordError),
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
                                  color: colors.darkAccentColor,
                                  fontSize: 14.0))
                        ],
                      ),
                      _isLoading
                          ? Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: CircularProgressIndicator())
                          : InkWell(
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
                                    onTap: () {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      _login();
                                    },
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
                            ),
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
