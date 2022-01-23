import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_spatial/Utils/Constants.dart';
import 'package:geo_spatial/Screens/ChangePassword.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

final storage = FlutterSecureStorage();

Future<String> jwtToken() async {
  var jwt = await storage.read(key: JWT_STORAGE_KEY);
  print(JWT_STORAGE_KEY + jwt.toString());

  if (jwt == null) return "";
  return jwt;
}

Future<http.Response> _getUserDetails() async {
  var jwt = await jwtToken();
  String url = NETWORK_ADDRESS;

  var res = await http.get(Uri.https(url, '/api/getUserData'), headers: {
    "Content-Type": "application/json",
    'user-auth-token': jwt
  }).timeout(
    const Duration(seconds: 30),
    onTimeout: () {
      showToast("Server Timed out! Showing last updated data");
      // Time has run out, do what you wanted to do.
      return http.Response(
          'Error', 408); // Request Timeout response status code
    },
  );
  print("RES: ${res.body}");

  return res;
}

Future<String> get _getUserData async {
  var userData = await storage.read(key: USER_DATA_KEY);
  try {
    var res = await _getUserDetails();
    if (res.statusCode == 200) {
      userData = res.body;
      await storage.write(key: USER_DATA_KEY, value: userData);
    }
  } catch (e) {}
  print("userData " + userData.toString());

  if (userData == null) return "";
  return userData;
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getUserData,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            var dataJson = json.decode(snapshot.requireData);
            var gender = dataJson[0]["gender"];
            return Scaffold(
              backgroundColor: Color.fromRGBO(36, 37, 56, 1),
              appBar: AppBarBackButton(
                'Profile',
                actions: [
                  IconButton(
                      splashRadius: 20,
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: colors.darkScaffoldColor,
                            title: Text(
                              "Are you sure?",
                              style: GoogleFonts.poppins(
                                  color: colors.darkPrimaryTextColor),
                            ),
                            content: Text(
                              "You will be logged out",
                              style: GoogleFonts.poppins(
                                  color: colors.darkPrimaryTextColor),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'No',
                                  style: GoogleFonts.poppins(
                                      color: colors.darkPrimaryTextColor),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: colors.darkAccentColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                child: Text('Yes',
                                    style: TextStyle(
                                        color: colors.darkPrimaryTextColor)),
                                onPressed: () async {
                                  await storage.delete(key: JWT_STORAGE_KEY);
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                      (Route<dynamic> route) => false);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.login_outlined,
                        color: colors.darkAccentColor,
                      ))
                ],
              ),
              resizeToAvoidBottomInset: true,
              body: Stack(children: [
                SvgPicture.asset('assets/svg/profile_bg.svg',
                    alignment: Alignment.center, fit: BoxFit.fill),
                CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Image(
                                  image: gender == "Male"
                                      ? AssetImage("assets/avatar_man.png")
                                      : AssetImage("assets/avatar_woman.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    dataJson[0]["Name"],
                                    style: GoogleFonts.poppins(fontSize: 20),
                                  ),
                                ),
                                Text(
                                  '@' + dataJson[0]["username"],
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: colors.darkSecondaryTextColor),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, top: 50),
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(top: 15, left: 20.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Color(0xff34344B)),
                                    height: 50,
                                    width: double.infinity,
                                    child: Text(
                                        'Joined on: ${dataJson[0]["DateJoined"]}'),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 15, left: 20.0),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Color(0xff34344B)),
                                  height: 50,
                                  child: Text(
                                      'Records collected: ${dataJson[0]["NumberOfRecordsCollected"]}'),
                                )
                              ],
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 20.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: colors.darkSecondaryTextColor
                                        .withOpacity(0.2),
                                  ),
                                  onPressed: () {
                                    print('Button Clicked');
                                    Route route = MaterialPageRoute(
                                        builder: (context) => ChangePassword(
                                            userName: dataJson[0]["username"]));
                                    Navigator.push(context, route);
                                  },
                                  icon: Icon(
                                    Icons.lock,
                                    color: colors.darkAccentColor,
                                  ),
                                  label: Text(
                                    'Change Password',
                                    style: GoogleFonts.poppins(
                                        color: colors.darkPrimaryTextColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ]),
            );
          } else {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }
        });
  }
}
