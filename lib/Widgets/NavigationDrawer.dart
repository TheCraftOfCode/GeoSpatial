import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Constants/Constants.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:geo_spatial/Screens/ProfilePage.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

final storage = FlutterSecureStorage();

Future<String> get _getUserData async {
  var userData = await storage.read(key: USER_DATA_KEY);
  print("userData " + userData.toString());

  if (userData == null) return "";
  return userData;
}

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getUserData,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            {
              var dataJson = json.decode(snapshot.requireData);
              var gender = dataJson[0]["gender"];

              return Drawer(
                child: Material(
                  color: colors.darkScaffoldColor,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      UserAccountsDrawerHeader(
                        currentAccountPicture: CircleAvatar(
                          child: ClipOval(
                            child: Image(
                              image: gender == "Male"
                                  ? AssetImage("assets/avatar_man.png")
                                  : AssetImage("assets/avatar_woman.png"),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/Illustration.png"))),
                        accountName: Text(
                          dataJson[0]["Name"],
                          style: GoogleFonts.poppins(
                              color: colors.darkPrimaryTextColor, fontSize: 18),
                        ),
                        accountEmail: Text(
                          dataJson[0]["username"],
                          style: GoogleFonts.poppins(
                              color: colors.darkSecondaryTextColor),
                        ),
                      ),
                      buildMenuItem(
                          text: 'Home',
                          icon: Icons.home,
                          onTap: () {
                            Navigator.of(context).pop();
                          }),
                      buildMenuItem(
                          text: 'Profile',
                          icon: Icons.person,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      buildMenuItem(
                        text: 'Sign Out',
                        icon: Icons.logout,
                        onTap: () async {
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
                      ),
                    ],
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: ListTile(
        selectedTileColor: colors.darkAccentColor,
        leading: Icon(
          icon,
          color: colors.darkPrimaryTextColor,
        ),
        title: Text(
          text,
          style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
        ),
        onTap: onTap,
      ),
    );
  }
}
