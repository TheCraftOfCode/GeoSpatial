import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/IndividualDataCollection.dart';
import 'package:geo_spatial/Widgets/DataCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Screens/Login.dart';

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
      backgroundColor: Color(0xffEAE7FA),
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Hello, ' + userName + '!',
            style: GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.person,
                color: Colors.black,
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
              color: Colors.black,
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
                IndividualDataCollection(),
                Color(0xFFF700FF),
                Color(0xff3D2C8D)),
            DataCard(
                'Community Details',
                'Data entry for communities',
                'assets/svg/house.svg',
                IndividualDataCollection(),
                Color(0xFF2E2FFF),
                Color(0xFF4FD586)),
            DataCard(
                'View saved data',
                'View all data saved in local storage',
                'assets/svg/storage_image.svg',
                IndividualDataCollection(),
                Color(0xFFFFA200),
                Color(0xFFBA0000)),
          ],
        ),
      ),
    );
  }
}
