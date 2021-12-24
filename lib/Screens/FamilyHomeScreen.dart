import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/FamilyDetails.dart';
import 'package:geo_spatial/Screens/FamilyMemberAdd.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AddRemoveBoxWidget.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DataCard.dart';

class FamilyHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButton('Individual Data'),
      backgroundColor: colors.darkScaffoldColor,
        body: SafeArea(
          child: Column(
            children: [
              AddRemoveBoxWidget(),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FamilyMemberAdd()));
              }, child: Text('Add Member')),
              DataCard("\nCollect Common Details","","",FamilyDetails(),Color(0xfff54b64),
                  Color(0xfff78361))
              ,
            ],
          ),
        ),
    );
  }
}

