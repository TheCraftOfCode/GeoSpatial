import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Constants/NetworkConfig.dart';
import 'package:geo_spatial/Widgets/FormCard.dart';
import 'package:geo_spatial/Screens/Home.dart';
import 'package:http/http.dart' as http;

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
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 120,
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xffEAE7FA),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: Image.asset("assets/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(child: Image.asset("assets/image_02.png"))
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 230,
                  ),
                  FormCard(_usernameController, _passwordController, _nameError,
                      _passwordError),
                  SizedBox(height: 25),
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
                              style: TextStyle(
                                fontSize: 15,
                              ))
                        ],
                      ),
                      InkWell(
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(500, 59, 5, 120),
                                Color.fromARGB(250, 157, 133, 244),
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: _login,
                              child: Center(
                                child: Text("SIGN IN",
                                    style: TextStyle(
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
