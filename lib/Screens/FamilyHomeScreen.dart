import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/FamilyDetails.dart';
import 'package:geo_spatial/Screens/FamilyMemberAdd.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AddRemoveBoxWidget.dart';
import 'package:geo_spatial/Widgets/DataCard.dart';

class FamilyHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.darkScaffoldColor,
        body: SafeArea(
          child: Column(
            children: [
              AddRemoveBoxWidget(),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FamilyMemberAdd()));
              }, child: Text('Add member')),
              DataCard("Collect common details","","",FamilyDetails(),colors.darkSecondAccentColor,colors.darkSecondAccentColor)
              ,
            ],
          ),
        ),
    );
  }
}

