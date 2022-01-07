import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Constants/Constants.dart';
import 'package:geo_spatial/Screens/FamilyHomeScreen.dart';
import 'package:geo_spatial/Screens/Home.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/CheckBoxAlertDialog.dart';
import 'package:geo_spatial/Widgets/PageViewContentBox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

final storage = FlutterSecureStorage();
String UID = "";
Map<String, bool> villages = {};
List? villageData;

class VillageSelectionScreen extends StatefulWidget {
  VillageSelectionScreen({Key? key}) : super(key: key);

  @override
  _VillageSelectionScreenState createState() => _VillageSelectionScreenState();
}

class _VillageSelectionScreenState extends State<VillageSelectionScreen> {
  Future<http.Response> _makeRequest(String node) async {
    String url = NETWORK_ADDRESS;

    var jwt = await storage.read(key: JWT_STORAGE_KEY);
    var res = await http.get(Uri.https(url, '/api/$node'),
        headers: {"user-auth-token": jwt.toString()});
    return res;
  }

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.darkScaffoldColor,
      appBar: AppBarBackButton('Generate UID'),
      body: SafeArea(
        child: PageViewContentBox(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<http.Response>(
                  future: _makeRequest("villageInfo/getVillageInfo"),
                  builder: (BuildContext context,
                      AsyncSnapshot<http.Response> snapshot) {
                    print(snapshot.data?.body);
                    if (snapshot.data == null)
                      return Text(
                        "Can't load data, your network might be turned off or the server might be down, click on Generate UIN later to continue without UIN",
                        textAlign: TextAlign.center,
                      );
                    else if (snapshot.data!.statusCode == 200) {
                      villageData = json.decode(snapshot.data!.body);
                      villageData?.forEach((element) {
                        villages[element["villageCode"]] = false;
                      });

                      return CheckBoxAlertDialog(
                        autoSave: true,
                        singleOption: true,
                        title: "Choose Village Code",
                        context: context,
                        hint: 'Choose here',
                        dataMap: villages,
                        onSaved: (data) {
                          data!.forEach((key, value) {
                            if (value) {
                              UID = key;
                            }
                          });
                          print(UID);
                        },
                      );
                    } else {
                      return Text(
                          "Can't load data, your network might be turned off or the server might be down, click on Generate UIN later to continue without UIN",
                          textAlign: TextAlign.center);
                    }
                  }),
              ContentChildWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class ContentChildWidget extends StatefulWidget {
  const ContentChildWidget({Key? key}) : super(key: key);

  @override
  _ContentChildWidgetState createState() => _ContentChildWidgetState();
}

class _ContentChildWidgetState extends State<ContentChildWidget> {
  late bool isGenerated;
  String lastModifiedUIN = "";

  initState() {
    super.initState();
    isGenerated = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 25.0, bottom: 75, right: 15.0, left: 25.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                child: Text("Generate UID",
                    style: GoogleFonts.poppins(fontSize: 15)),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        colors.darkScaffoldColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side:
                                BorderSide(color: colors.darkScaffoldColor)))),
                onPressed: () {
                  villageData?.forEach((element) {
                    if (UID != "") {
                      if (element["villageCode"] == UID) {
                        setState(() {
                          lastModifiedUIN = element["LastModifiedUIN"];
                          //TODO:Modify CODE

                        });
                      }
                    } else {
                      //TODO:Ask user to pick a code
                    }
                  });
                  setState(() {
                    isGenerated = true;
                  });
                }),
          ),
        ),
        if (isGenerated)
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 10,
            color: colors.darkScaffoldColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "UID: ${lastModifiedUIN}",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: colors.darkPrimaryTextColor),
                    ),
                  ),
                  ElevatedButton.icon(
                    label: Text("Continue",
                        style: GoogleFonts.poppins(fontSize: 15)),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            colors.lightPrimaryTextColor),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            colors.darkPrimaryTextColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                        color: colors.darkScaffoldColor)))),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => FamilyHomeScreen()));
                    },
                    icon: Icon(Icons.arrow_right_alt_sharp),
                  ),
                ],
              ),
            ),
          ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        if (!isGenerated)
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        FamilyHomeScreen(isGenerated: isGenerated)));
              },
              child: Text("Generate UIN later"))
      ],
    );
  }
}
