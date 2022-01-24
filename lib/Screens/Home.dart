import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:geo_spatial/Utils/CheckNetworkConnectivity.dart';
import 'package:geo_spatial/Utils/Constants.dart';
import 'package:geo_spatial/Screens/CommunityDataCollection.dart';
import 'package:geo_spatial/Screens/FamilyHomeScreen.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/DataCard.dart';
import 'package:geo_spatial/Widgets/NavigationDrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:http/http.dart' as http;

import 'EditExistingRecordsPage.dart';
import 'SavedData.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

final storage = FlutterSecureStorage();

Future<String> get _getUserName async {
  var userName = await storage.read(key: USER_DATA_KEY);
  print("userData " + userName.toString());

  if (userName == null) return "";
  return userName;
}

class _HomeWidgetState extends State<Home> {
  final NetworkConnectivity _connectivity = NetworkConnectivity.instance;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) async {
      if (source == ConnectivityResult.none) {
        showToast(
            "Offline mode, data cannot be uploaded until device is connected to the internet");
      } else {
        var jwt = await storage.read(key: JWT_STORAGE_KEY);
        if (jwt != null) {
          var res = await http
              .get(Uri.https(NETWORK_ADDRESS, '/api/validateToken'), headers: {
            "Content-Type": "application/json",
            'user-auth-token': jwt
          }).timeout(Duration(seconds: 30));
          if (res.statusCode == 401) {
            await storage.delete(key: JWT_STORAGE_KEY);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (Route<dynamic> route) => false);
            showToast("Invalid token or token not found, logging out");
          }
        }
      }
      print("CONNECTED: ${source}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  backgroundColor: colors.darkScaffoldColor,
                  title: Text(
                    "Are you sure you want to quit?",
                    style: GoogleFonts.poppins(
                        color: colors.darkPrimaryTextColor, fontSize: 15),
                  ),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: colors.darkAccentColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        onPressed: () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                        child: Text(
                          'Yes',
                          style: GoogleFonts.poppins(
                              color: colors.darkPrimaryTextColor),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'No',
                          style: GoogleFonts.poppins(
                              color: colors.darkPrimaryTextColor),
                        ))
                  ],
                ));
        return result;
      },
      child: Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: colors.darkScaffoldColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: colors.darkAccentColor),
          elevation: 40,
          title: FutureBuilder(
            future: _getUserName,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                var dataJson = json.decode(snapshot.requireData);
                print("DATA: ${snapshot.requireData}");
                return Text(
                  'Hello, ' + dataJson[0]["Name"] + '!',
                  style: GoogleFonts.montserrat(
                      fontSize: 18, color: colors.darkPrimaryTextColor),
                );
              } else {
                return Text(
                  'Geo Spatial Api!',
                  style: GoogleFonts.montserrat(
                      fontSize: 18, color: colors.darkPrimaryTextColor),
                );
              }
            },
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DataCard(
                  'Individual data',
                  'Individual data entry for everyone in home',
                  'assets/svg/female.svg',
                  //FamilyHomeScreen(),
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
              // DataCard(
              //     'Edit Existing Record',
              //     'Edit information of an existing person',
              //     'assets/svg/male.svg',
              //     EditRecordsScreen(),
              //     Color(0xfff54b64),
              //     Color(0xfff78361)),
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
      ),
    );
  }
}
