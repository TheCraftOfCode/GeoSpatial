import 'package:flutter/material.dart';
import 'package:geo_spatial/Model/FamilyMembersCommomDataModel.dart';
import 'package:geo_spatial/Screens/FamilyMemberAdd.dart';
import 'package:geo_spatial/Utils/StoreInstance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

import '../objectbox.g.dart';

/**
 * Added a dataclass
 * To be modified later
 * Add required data fields to this class
 */

class IndividualUserData {}

class AddRemoveBoxWidget extends StatefulWidget {
  const AddRemoveBoxWidget({Key? key, this.modelData}) : super(key: key);
  final modelData;

  @override
  _AddRemoveBoxWidgetState createState() => _AddRemoveBoxWidgetState();
}

class _AddRemoveBoxWidgetState extends State<AddRemoveBoxWidget> {
  var listOfObjects = [];

  getElementFromDb() async {
    var store = await StoreInstance.getInstance();
    Box box = store.box<FamilyMemberIndividualDataModel>();
    for (int i in widget.modelData.keys) {
      listOfObjects.add(await box.get(i));
      setState(() {});
    }
  }

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    getElementFromDb().whenComplete(() {
      setState(() {});
      print("success");
    }).catchError((error, stackTrace) {
      print("outer: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      color: colors.darkScaffoldColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          color: colors.darkScaffoldColor,
          height: MediaQuery.of(context).size.height * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () async {
                    var store = await StoreInstance.getInstance();
                    Box box = store.box<FamilyMemberIndividualDataModel>();
                    var object = new FamilyMemberIndividualDataModel();

                    int id = await box.put(object);

                    setState(() {
                      listOfObjects.add(object);
                      widget.modelData.keys?.add(id);
                    });
                  },
                  child: Text("Add New User Information",
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: colors.darkAccentColor)),),
                  IconButton(
                      onPressed: () async {
                        var store = await StoreInstance.getInstance();
                        Box box = store.box<FamilyMemberIndividualDataModel>();
                        var object = new FamilyMemberIndividualDataModel();

                        int id = await box.put(object);

                        setState(() {
                          listOfObjects.add(object);
                          widget.modelData.keys?.add(id);
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
                height: MediaQuery.of(context).size.height * 0.35,
                child: listOfObjects.isEmpty
                    ? Center(child: Text('No Members Added'))
                    : ListView.builder(
                        itemCount: listOfObjects.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: colors.darkSecondBackgroundColor,
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FamilyMemberAdd(
                                        familyMemberIndividualDataModel:
                                            listOfObjects.elementAt(index))));
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
                                onPressed: () async {
                                  int id = listOfObjects.elementAt(index).id;

                                  var store = await StoreInstance.getInstance();
                                  Box box = store
                                      .box<FamilyMemberIndividualDataModel>();
                                  box.remove(id);

                                  widget.modelData.keys?.remove(id);
                                  setState(() {
                                    listOfObjects.removeAt(index);
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
