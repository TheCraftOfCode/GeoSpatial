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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Joined on: '),
                  Text('Records collected: '),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
