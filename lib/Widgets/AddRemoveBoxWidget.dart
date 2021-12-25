import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/FamilyMemberAdd.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

/**
 * Added a dataclass
 * To be modified later
 * Add required data fields to this class
 */

class IndividualUserData {}

class AddRemoveBoxWidget extends StatefulWidget {
  const AddRemoveBoxWidget({Key? key}) : super(key: key);

  @override
  _AddRemoveBoxWidgetState createState() => _AddRemoveBoxWidgetState();
}

class _AddRemoveBoxWidgetState extends State<AddRemoveBoxWidget> {
  var listOfElements = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      color: colors.darkScaffoldColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          color: colors.darkScaffoldColor,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add New User Information",
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: colors.darkAccentColor)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          listOfElements.add(new IndividualUserData());
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        color: colors.darkAccentColor,
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: listOfElements.isEmpty
                    ? Center(child: Text('No Members Added'))
                    : ListView.builder(
                        itemCount: listOfElements.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: colors.darkAccentColor,
                            child: ListTile(
                              onTap: () {
                                var obj =
                                    listOfElements[index]; //Modify this object
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FamilyMemberAdd()));
                              },
                              //Pass a function which is called onSaved in the next page and add data to the class object
                              leading: Icon(Icons.person),
                              title: Text(
                                "User ${index + 1}",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20),
                              ),
                              trailing: IconButton(
                                color: colors.darkSecondAccentColor,
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    listOfElements.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          );
                        }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
