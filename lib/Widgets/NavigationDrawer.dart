import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/ProfilePage.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/Utils.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserData,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            {
              var dataJson = json.decode(snapshot.requireData);
              var gender = dataJson[0]["gender"];

              return Drawer(
                child: Material(
                  color: colors.darkScaffoldColor,
                  child: Column(
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
                      Expanded(child: Container()),
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
                          logoutDialog(context);
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
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        selectedTileColor: colors.darkAccentColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            icon,
            color: colors.darkAccentColor,
          ),
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
