import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/FamilyMemberAdd.dart';
import 'package:geo_spatial/Screens/FamilyMemberEdit.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Personal Data',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Icon(
              Icons.arrow_back_ios_sharp,
            )
          ],
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: Image.asset("assets/image_03.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Image.asset("assets/image_02.png"),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0),
              child: Column(
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
          )
        ]));
  }
}
