import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/FamilyMemberAdd.dart';
import 'package:geo_spatial/Screens/FamilyMemberEdit.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DataCard.dart';

class IndividualDataCollection extends StatefulWidget {
  const IndividualDataCollection({Key? key}) : super(key: key);

  @override
  _IndividualDataCollectionState createState() =>
      _IndividualDataCollectionState();
}

class _IndividualDataCollectionState extends State<IndividualDataCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBackButton('Personal Data'),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DataCard(
                      'Add new person',
                      'Enter details of a new family member',
                      'assets/svg/female.svg',
                      FamilyMemberAdd(),
                      Color(0xFFF700FF),
                      Color(0xff3D2C8D)),
                  DataCard(
                      'Edit existing person',
                      'Edit details of an existing family member',
                      'assets/svg/female.svg',
                      FamilyMemberEdit(),
                      Color(0xFF2E2FFF),
                      Color(0xFF4FD586)),
                ],
              ),
            ),
          ),
        ));
  }
}
