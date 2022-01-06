import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/Globals.dart' as globals;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SvgPicture.asset(
          'assets/svg/profile_bg.svg',
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarBackButton(
              'Profile',
              actions: [
                IconButton(
                    onPressed: () async {
                      await storage.delete(key: 'jwt');
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Login()),
                          (Route<dynamic> route) => false);
                    },
                    icon: Icon(
                      Icons.logout,
                      color: colors.darkAccentColor,
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Center(
              child: Column(
                children: [
                  Image(image: AssetImage("assets/avatar_woman.png")),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      globals.Name,
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                  ),
                  Text(
                    '@' + globals.userName,
                    style: GoogleFonts.poppins(
                        fontSize: 15, color: colors.darkSecondaryTextColor),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 6, left: 20),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: colors.darkSecondaryTextColor.withOpacity(0.2),
                        ),
                        onPressed: () {
                          print('Button Clicked');
                        },
                        icon: Icon(
                          Icons.lock,
                          color: colors.darkAccentColor,
                        ),
                        label: Text(
                          'Change\nPassword',
                          style: GoogleFonts.poppins(
                              color: colors.darkPrimaryTextColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 6, right: 20),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: colors.darkSecondaryTextColor.withOpacity(0.2),
                        ),
                        onPressed: () {
                          print('Button Clicked');
                        },
                        label: Text(
                          'Change\nUsername',
                          style: GoogleFonts.poppins(
                              color: colors.darkPrimaryTextColor),
                          textAlign: TextAlign.center,
                        ),
                        icon: Icon(
                          Icons.person,
                          color: colors.darkAccentColor,
                        ),
                      ),
                    ),
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
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      padding: EdgeInsets.only(top: 15, left: 20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xff34344B)),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text('Joined on: '),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, left: 20.0),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xff34344B)),
                    height: 50,
                    child: Text('Records collected: '),
                  )
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
