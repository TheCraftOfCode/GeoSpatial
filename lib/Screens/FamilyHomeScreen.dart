import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/FamilyDetails.dart';
import 'package:geo_spatial/Screens/FamilyMemberAdd.dart';

class FamilyHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FamilyMemberAdd()));
              }, child: Text('Add member')),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyDetails()));
              }, child: Text('Get common details')),
            ],
          ),
        ),
    );
  }
}
