import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Constants/Constants.dart';
import 'package:geo_spatial/Screens/Home.dart';
import 'package:geo_spatial/Utils/colors.dart' as colors;
import 'package:geo_spatial/Widgets/LoginFormCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

final storage = FlutterSecureStorage();

class Login extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}
enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class _MyAppState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var _nameError = null;
  var _passwordError = null;
  bool _isSelected = false;


  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;


  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
          ? _SupportState.supported
          : _SupportState.unsupported),
    );
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason:
          'Scan your fingerprint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
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

    var res = await http.post(Uri.https(url, '/api/login'),
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
          SvgPicture.asset("assets/svg/background.svg",fit: BoxFit.cover,),
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
                              onTap: () {
                                _login();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Home()),
                                // );
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.125,
                        bottom: 30),
                    child: IconButton(
                        onPressed: () async {
                          //bool canCheckBiometrics =
                              //await localAuth.canCheckBiometrics;
                        },
                        icon: Icon(
                          Icons.fingerprint_rounded,
                          size: 80,
                          color: colors.darkAccentColor,
                        ),
                    splashColor: colors.darkSecondAccentColor,
                    enableFeedback: true,),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
