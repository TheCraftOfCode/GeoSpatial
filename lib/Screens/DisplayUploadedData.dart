import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/DisplayUploadedFamilyData.dart';
import 'package:geo_spatial/Screens/DisplayUploadedCommunityData.dart';

import '../Widgets/AppBarBackButtonWidget.dart';
import '../Widgets/DataCard.dart';

class DisplayUploadedData extends StatelessWidget {
  const DisplayUploadedData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButton("View Uploaded Records"),
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
                DisplayFamilyData(),
                Color(0xfff54b64),
                Color(0xfff78361)),
            DataCard(
                'Community Details',
                'Data entry for communities',
                'assets/svg/house.svg',
                DisplayVillageData(),
                Color(0xfff54b64),
                Color(0xfff78361)),

          ],
        ),
      ),
    );
  }
}
