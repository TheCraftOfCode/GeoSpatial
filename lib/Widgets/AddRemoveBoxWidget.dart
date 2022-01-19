import 'package:flutter/material.dart';
import 'package:geo_spatial/Model/FamilyMembersCommonDataModel.dart';
import 'package:geo_spatial/Screens/FamilyMemberAdd.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

/**
 * Added a dataclass
 * To be modified later
 * Add required data fields to this class
 */

class AddRemoveBoxWidget extends StatefulWidget {
  const AddRemoveBoxWidget({Key? key, this.modelData}) : super(key: key);
  final FamilyMembersCommonDataModel? modelData;

  @override
  _AddRemoveBoxWidgetState createState() => _AddRemoveBoxWidgetState();
}

class _AddRemoveBoxWidgetState extends State<AddRemoveBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      widget.modelData?.individualDataListTransient
                          .add(FamilyMemberIndividualDataModel());
                    });
                  },
                  child: Text("Add New User Information",
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: colors.darkAccentColor)),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.modelData?.individualDataListTransient
                            .add(FamilyMemberIndividualDataModel());
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: colors.darkAccentColor,
                    ))
              ],
            ),
            Flexible(
              child: Container(
                child: widget.modelData!.individualDataListTransient.isEmpty
                    ? Center(child: Text('No Members Added'))
                    : ListView.builder(
                        itemCount: widget
                            .modelData!.individualDataListTransient.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: colors.darkSecondBackgroundColor,
                         /**
                         * Re-renders tiles whenever visibility changed
                         * i.e, when user comes back from user page,
                         * page re rendered and user name is reflected
                         */
                            child: VisibilityDetector(
                              onVisibilityChanged: (VisibilityInfo info) {
                                setState(() {}); //Re-renders page
                              },
                              key: Key('add-remove-widget-key'),
                              child: ListTile(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => FamilyMemberAdd(
                                            familyMemberIndividualDataModel:
                                                widget.modelData!
                                                    .individualDataListTransient
                                                    .elementAt(index))));
                                  },
                                  leading: Icon(Icons.person),
                                  title: Text(
                                    widget.modelData!
                                                    .individualDataListTransient
                                                    .elementAt(index)
                                                    .userName !=
                                                null &&
                                            widget.modelData!
                                                    .individualDataListTransient
                                                    .elementAt(index)
                                                    .userName !=
                                                ''
                                        ? widget.modelData!
                                            .individualDataListTransient
                                            .elementAt(index)
                                            .userName!
                                        : "User ${index + 1}",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20),
                                  ),
                                  trailing: IconButton(
                                      color: colors.darkSecondAccentColor,
                                      icon: Icon(Icons.close),
                                      onPressed: () async {
                                        Dialog(index);
                                      })),
                            ),
                          );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Dialog(index) async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: colors.darkScaffoldColor,
          title: Text(
            "Are you sure?",
            style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
          ),
          content: Text(
            "All unsaved changes will be lost",
            style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'No',
                style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: colors.darkAccentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                child: Text(
                  'Yes',
                  style:
                      GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
                ),
                onPressed: () {
                  setState(() {
                    widget.modelData!.individualDataListTransient
                        .removeAt(index);
                  });
                  Navigator.pop(context);
                })
          ]),
    );
    return result;
  }
}
