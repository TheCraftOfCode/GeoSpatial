import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_spatial/Constants/Constants.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

final storage = FlutterSecureStorage();

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

Future<String> get jwtToken async {
  var jwt = await storage.read(key: JWT_STORAGE_KEY);
  print(JWT_STORAGE_KEY + jwt.toString());

  if (jwt == null) return "";
  return jwt;
}

Future<http.Response> _makeLoginRequest(
    String username, String currentPassword, String newPassword) async {
  String url = NETWORK_ADDRESS;
  var body = json
      .encode({"password": newPassword, "currentPassword": currentPassword});

  String jwt = await jwtToken;

  var res = await http.post(
      Uri.https(url, '/api/changeUserPassword/${username}'),
      headers: {"Content-Type": "application/json", 'user-auth-token': jwt},
      body: body);
  print("RES: ${res.body}");

  return res;
}

class _ChangePasswordState extends State<ChangePassword> {
  var passwordOld = "";
  var passwordNew = "";
  final _oldPasswordKey = GlobalKey<FormFieldState>();
  final _newPasswordKey = GlobalKey<FormFieldState>();
  final _newPasswordKeyRepeat = GlobalKey<FormFieldState>();

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          key: _oldPasswordKey,
                          controller: _oldPasswordController,
                          style: GoogleFonts.poppins(
                              color: colors.darkPrimaryTextColor),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: _newPasswordController,
                          key: _newPasswordKey,
                          style: GoogleFonts.poppins(
                              color: colors.darkPrimaryTextColor),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
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
                              } else {
                                return null;
                              }
                            } else
                              return "Please enter password";
                          },
                          autovalidateMode: AutovalidateMode.disabled,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          key: _newPasswordKeyRepeat,
                          style: GoogleFonts.poppins(
                              color: colors.darkPrimaryTextColor),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
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
                              } else if (true) {
                              } else {
                                return null;
                              }
                            } else
                              return "Please enter password";
                          },
                          autovalidateMode: AutovalidateMode.disabled,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: SizedBox(
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
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: colors
                                                .darkSecondBackgroundColor)))),
                            onPressed: () {
                              if (_oldPasswordKey.currentState!.validate() &&
                                  _newPasswordKey.currentState!.validate() &&
                                  _newPasswordKeyRepeat.currentState!
                                      .validate()) {
                                _makeLoginRequest(
                                    "",
                                    _oldPasswordController.text,
                                    _newPasswordController.text);
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
