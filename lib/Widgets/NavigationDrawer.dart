import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/Globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {

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
                    image: AssetImage("assets/avatar_man.png"),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/Illustration.png"))),
              accountName: Text(
                globals.Name,
                style: GoogleFonts.poppins(
                    color: colors.darkPrimaryTextColor, fontSize: 18),
              ),
              accountEmail: Text(
                globals.userName,
                style:
                    GoogleFonts.poppins(color: colors.darkSecondaryTextColor),
              ),
            ),
            buildMenuItem(text: 'Home', icon: Icons.home, onTap: () {}),
            buildMenuItem(text: 'Profile', icon: Icons.person, onTap: () {}),
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
                await storage.delete(key: 'jwt');
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Login()),
                        (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
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
