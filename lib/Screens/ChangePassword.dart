import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_spatial/Utils/Constants.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/Utils.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _oldPasswordKey = GlobalKey<FormFieldState>();
  final _newPasswordKey = GlobalKey<FormFieldState>();
  final _newPasswordKeyRepeat = GlobalKey<FormFieldState>();

  var _showPasswordOld = false;
  var _showPasswordNew = false;
  var _showPasswordNewRepeat = false;

  var _showProgressBar = false;

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordControllerRepeat =
      TextEditingController();

  Future<http.Response> _makeLoginRequest(
      String username, String currentPassword, String newPassword) async {
    String url = NETWORK_ADDRESS;
    var body = json
        .encode({"password": newPassword, "currentPassword": currentPassword});

    String jwt = await jwtToken;

    var res = await http
        .put(Uri.https(url, '/api/changeUserPassword'),
            headers: {
              "Content-Type": "application/json",
              'user-auth-token': jwt
            },
            body: body)
        .timeout(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 37, 56, 1),
      resizeToAvoidBottomInset: true,
      appBar: AppBarBackButton('Change Password'),
      body: Stack(
        children: [
          SvgPicture.asset('assets/svg/profile_bg.svg', fit: BoxFit.fill),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'assets/svg/storage_image.svg',
                        ),
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20),
                        child: TextFormField(
                          obscureText: !_showPasswordOld,
                          key: _oldPasswordKey,
                          controller: _oldPasswordController,
                          style: GoogleFonts.poppins(
                              color: colors.darkPrimaryTextColor),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPasswordOld = !_showPasswordOld;
                                });
                              },
                              icon: Icon(
                                _showPasswordOld
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: colors.darkAccentColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.darkSecondaryTextColor,
                                    width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.successColor, width: 1.0)),
                            label: Text(
                              "Enter current password",
                              style: GoogleFonts.poppins(
                                  color: colors.darkSecondaryTextColor),
                            ),
                            hintText: "Enter password here",
                            hintStyle: GoogleFonts.poppins(
                                color: colors.darkSecondaryTextColor),
                            contentPadding: EdgeInsets.all(7.0),
                          ),
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (value.length <= 7) {
                                return "Password too small";
                              } else {
                                return null;
                              }
                            } else
                              return "Please enter password";
                          },
                          autovalidateMode: AutovalidateMode.disabled,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20),
                        child: TextFormField(
                          obscureText: !_showPasswordNew,
                          controller: _newPasswordController,
                          key: _newPasswordKey,
                          style: GoogleFonts.poppins(
                              color: colors.darkPrimaryTextColor),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPasswordNew = !_showPasswordNew;
                                });
                              },
                              icon: Icon(
                                _showPasswordNew
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: colors.darkAccentColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.darkSecondaryTextColor,
                                    width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.successColor, width: 1.0)),
                            label: Text(
                              "Enter new password",
                              style: GoogleFonts.poppins(
                                  color: colors.darkSecondaryTextColor),
                            ),
                            hintText: "Enter password here",
                            hintStyle: GoogleFonts.poppins(
                                color: colors.darkSecondaryTextColor),
                            contentPadding: EdgeInsets.all(7.0),
                          ),
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (value.length <= 7) {
                                return "Password too small";
                              } else if (value !=
                                  _newPasswordControllerRepeat.text) {
                                return "Password does not match";
                              } else {
                                return null;
                              }
                            } else
                              return "Please enter password";
                          },
                          autovalidateMode: AutovalidateMode.disabled,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20),
                        child: TextFormField(
                          obscureText: !_showPasswordNewRepeat,
                          controller: _newPasswordControllerRepeat,
                          key: _newPasswordKeyRepeat,
                          style: GoogleFonts.poppins(
                              color: colors.darkPrimaryTextColor),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPasswordNewRepeat =
                                      !_showPasswordNewRepeat;
                                });
                              },
                              icon: Icon(
                                _showPasswordNewRepeat
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: colors.darkAccentColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.darkSecondaryTextColor,
                                    width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colors.successColor, width: 1.0)),
                            label: Text(
                              "Re-Enter new password",
                              style: GoogleFonts.poppins(
                                  color: colors.darkSecondaryTextColor),
                            ),
                            hintText: "Enter password here",
                            hintStyle: GoogleFonts.poppins(
                                color: colors.darkSecondaryTextColor),
                            contentPadding: EdgeInsets.all(7.0),
                          ),
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (value.length <= 7) {
                                return "Password too small";
                              } else if (value != _newPasswordController.text) {
                                return "Password does not match";
                              } else {
                                return null;
                              }
                            } else
                              return "Please enter password";
                          },
                          autovalidateMode: AutovalidateMode.disabled,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20),
                        child: _showProgressBar
                            ? CircularProgressIndicator()
                            : SizedBox(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  child: Text("Change Password",
                                      style: TextStyle(fontSize: 16)),
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              colors.lightPrimaryTextColor),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              colors.darkPrimaryTextColor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              side: BorderSide(
                                                  color:
                                                      colors.darkSecondBackgroundColor)))),
                                  onPressed: () async {
                                    bool oldPassword = _oldPasswordKey
                                        .currentState!
                                        .validate();
                                    bool newPassword = _newPasswordKey
                                        .currentState!
                                        .validate();
                                    bool newPasswordRepeat =
                                        _newPasswordKeyRepeat.currentState!
                                            .validate();
                                    if (oldPassword &&
                                        newPassword &&
                                        newPasswordRepeat) {
                                      try {
                                        setState(() {
                                          _showProgressBar = true;
                                        });
                                        http.Response res =
                                            await _makeLoginRequest(
                                                widget.userName,
                                                _oldPasswordController.text,
                                                _newPasswordController.text);

                                        if (res.statusCode != 200) {
                                          showToast(res.body);
                                        } else {
                                          showToast(
                                              "Password changed successfully!");
                                          Navigator.pop(context);
                                        }

                                        setState(() {
                                          _showProgressBar = false;
                                        });
                                      } catch (e) {
                                        setState(() {
                                          _showProgressBar = false;
                                        });
                                        showToast(
                                          "Something went wrong, please check your network connection or try again later",
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
