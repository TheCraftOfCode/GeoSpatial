import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/CommunityDataCollection.dart';
import 'package:geo_spatial/Screens/FamilyHomeScreen.dart';
import 'package:geo_spatial/Widgets/DataCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

final storage = FlutterSecureStorage();

class _HomeWidgetState extends State<Home> {
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.darkScaffoldColor,
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Hello, ' + userName + '!',
            style: GoogleFonts.montserrat(fontSize: 20, color: colors.darkPrimaryTextColor),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.person,
                color: colors.darkAccentColor,
              ),
              onPressed: () async {
                await storage.delete(key: 'jwt');
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false);
              },
            )
          ],
          leading: IconButton(
            splashRadius: 20,
            icon: Icon(
              Icons.settings,
              color: colors.darkAccentColor,
            ),
            onPressed: () {},
          )),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DataCard(
                'Individual data',
                'Individual data entry for everyone in home',
                'assets/svg/female.svg',
                FamilyHomeScreen(),
                Color(0xfff54b64),
            Color(0xfff78361)),
            DataCard(
                'Community Details',
                'Data entry for communities',
                'assets/svg/house.svg',
                CommunityDataCollection(),
                Color(0xfff54b64),
                Color(0xfff78361)),
            DataCard(
                'Edit Existing Record',
                'Edit information of an existing person',
                'assets/svg/male.svg',
                CommunityDataCollection(),
                Color(0xfff54b64),
                Color(0xfff78361)),
            DataCard(
                'View saved data',
                'View all data saved in local storage',
                'assets/svg/storage_image.svg',
                CommunityDataCollection(),
                Color(0xfff54b64),
                Color(0xfff78361)),

          ],
        ),
      ),
    );
  }
}
