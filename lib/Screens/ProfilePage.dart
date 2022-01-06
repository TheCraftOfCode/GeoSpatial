import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            AppBarBackButton('Profile'),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: colors.darkSecondaryTextColor.withOpacity(0.2),
                    ),
                    onPressed: () {
                      print('Button Clicked');
                    },
                    child: Text(
                      'Change\nPassword',
                      style: GoogleFonts.poppins(
                          color: colors.darkPrimaryTextColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: colors.darkSecondaryTextColor.withOpacity(0.2),
                    ),
                    onPressed: () {
                      print('Button Clicked');
                    },
                    child: Text(
                      'Change\nUsername',
                      style: GoogleFonts.poppins(
                          color: colors.darkPrimaryTextColor),
                      textAlign: TextAlign.center,
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
                      padding: EdgeInsets.only(top: 15,left: 20.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Color(0xff34344B)),
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Text('Joined on: '),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15,left: 20.0),
                    width: MediaQuery.of(context).size.width*0.8,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Color(0xff34344B)),
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
