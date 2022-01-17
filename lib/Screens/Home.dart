import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Screens/CommunityDataCollection.dart';
import 'package:geo_spatial/Screens/NestedOptionsWidget.dart';
import 'package:geo_spatial/Screens/VillageSelection.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/Globals.dart' as globals;
import 'package:geo_spatial/Widgets/DataCard.dart';
import 'package:geo_spatial/Widgets/NavigationDrawer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'EditExistingRecordsPage.dart';
import 'SavedData.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

final storage = FlutterSecureStorage();

class _HomeWidgetState extends State<Home> {
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
                          Navigator.pop(context, true);
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
          elevation: 40,
          title: Text(
            'Hello, ' + globals.Name + '!',
            style: GoogleFonts.montserrat(
                fontSize: 18, color: colors.darkPrimaryTextColor),
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
                  VillageSelectionScreen(),
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
                      villageCode: "Temple")*/
                      ),
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
              DataCard(
                  'Debug Card',
                  'Debug and test pages here',
                  'assets/svg/houses.svg',
                  //FamilyHomeScreen(),
                  NestedOptionWidget(
                    title: "Select your options",
                    onChanged: (val){
                      for(var i in val){
                        print(i.boxName);
                        print(i.subOptionDataMap.toString());
                        print(i.isSelected);
                        print("\n");
                      }
                      print(val);
                    },
                    nestedOptionData: [
                      new NestedOptionData(subOptionDataMap: {"yes" : true, "no" : true}, boxName: 'One'),
                      new NestedOptionData(subOptionDataMap: {"yes" : true, "no" : true}, boxName: 'Two'),
                      new NestedOptionData(subOptionDataMap: {"yes" : true, "no" : true}, boxName: 'Three'),
                      new NestedOptionData(subOptionDataMap: {"yes" : false, "no" : false}, boxName: 'Four'),
                      new NestedOptionData(subOptionDataMap: {"yes" : false, "no" : false}, boxName: 'Five'),
                      new NestedOptionData(subOptionDataMap: {"yes" : false, "no" : false}, boxName: 'Six'),
                      new NestedOptionData(subOptionDataMap: {"yes" : false, "no" : false}, boxName: 'Seven')
                    ],
                  ),
                  Color(0xfff54b64),
                  Color(0xfff78361)),
            ],
          ),
        ),
      ),
    );
  }
}
