import 'package:flutter/material.dart';
import 'package:geo_spatial/Model/CommunityDataModel.dart';
import 'package:geo_spatial/Screens/CommunityDataCollection.dart';
import 'package:geo_spatial/Screens/FamilyHomeScreen.dart';
import 'package:geo_spatial/Widgets/DataCard.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

import 'EditExistingRecordsPage.dart';
import 'SavedData.dart';

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
            style: GoogleFonts.montserrat(
                fontSize: 20, color: colors.darkPrimaryTextColor),
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
                CommunityDataCollection(
                  /*
                    modelData: new CommunityDataModel(
                        resourceType: "Bakeries",
                        locationBottomLeft: new Position(
                            latitude: 1.2,
                            longitude: 2.4,
                            accuracy: 32,
                            heading: 21,
                            speedAccuracy: 32,
                            altitude: 23,
                            speed: 32,
                            timestamp: null),
                    locationBottomRight: new Position(
                        latitude: 1.2,
                        longitude: 2.4,
                        accuracy: 32,
                        heading: 21,
                        speedAccuracy: 32,
                        altitude: 23,
                        speed: 32,
                        timestamp: null),
                    locationTopRight: new Position(
                        latitude: 1.2,
                        longitude: 2.4,
                        accuracy: 32,
                        heading: 21,
                        speedAccuracy: 32,
                        altitude: 23,
                        speed: 32,
                        timestamp: null),
                    locationTopLeft: new Position(
                        latitude: 1.2,
                        longitude: 2.4,
                        accuracy: 32,
                        heading: 21,
                        speedAccuracy: 32,
                        altitude: 23,
                        speed: 32,
                        timestamp: null),
                    villageCode: "Temple")*/),
                Color(0xfff54b64),
                Color(0xfff78361)),
            DataCard(
                'Edit Existing Record',
                'Edit information of an existing person',
                'assets/svg/male.svg',
                EditRecordsScreen(),
                Color(0xfff54b64),
                Color(0xfff78361)),
            DataCard(
                'View saved data',
                'View all data saved in local storage',
                'assets/svg/storage_image.svg',
                SavedDataPage(),
                Color(0xfff54b64),
                Color(0xfff78361)),
          ],
        ),
      ),
    );
  }
}
