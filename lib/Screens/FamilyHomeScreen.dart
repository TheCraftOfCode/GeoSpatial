import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geo_spatial/Utils/Constants.dart';
import 'package:geo_spatial/Model/FamilyDataModels.dart';
import 'package:geo_spatial/Screens/FamilyDetails.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/Utils.dart';
import 'package:geo_spatial/Utils/StoreInstance.dart';
import 'package:geo_spatial/Widgets/AddRemoveBoxWidget.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DataCard.dart';
import 'package:geo_spatial/objectbox.g.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'CollectLocationWidget.dart';
import 'package:http/http.dart' as http;

class FamilyHomeScreen extends StatefulWidget {
  FamilyHomeScreen({Key? key, this.modelData}) : super(key: key);

  @override
  State<FamilyHomeScreen> createState() => _FamilyHomeScreenState();
  final modelData;
}

FamilyMembersCommonDataModel? modelData;

class _FamilyHomeScreenState extends State<FamilyHomeScreen> {
  void initState() {
    super.initState();
    setState(() {
      if (modelData == null)
        modelData = widget.modelData ?? new FamilyMembersCommonDataModel();
      for (var i in modelData!.individualDataList) {
        modelData!.individualDataListTransient.add(i);
      }
    });
  }

  Future<http.Response> _makeRequest(var data, String node) async {
    String url = NETWORK_ADDRESS;
    var body = json.encode(data);

    var jwt = await jwtToken;

    var res = await http
        .post(Uri.https(url, node),
            headers: {
              "Content-Type": "application/json",
              "user-auth-token": jwt
            },
            body: body)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        showToast("Server Timed out!");
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    );
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await closePage(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarBackButton('Individual Data'),
        backgroundColor: colors.darkScaffoldColor,
        body: SafeArea(
          child: Column(
            children: [
              AddRemoveBoxWidget(
                modelData: modelData,
              ),
              DataCard(
                  "\nCollect Common Details",
                  "",
                  "assets/svg/house.svg",
                  FamilyDetails(
                    modelData: modelData,
                  ),
                  Color(0xfff54b64),
                  Color(0xfff78361)),
              DataCard(
                  "Record GPS Data",
                  "Make sure GPS is enabled",
                  "assets/svg/map.svg",
                  CollectLocationWidget(modelData: modelData),
                  Color(0xfff54b64),
                  Color(0xfff78361)),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 10.0, left: 10.0, right: 10.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                            child:
                                Text("Submit", style: TextStyle(fontSize: 14)),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        colors.darkSecondBackgroundColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: colors
                                                .darkSecondBackgroundColor)))),
                            onPressed: () async {
                              bool isValid = true;
                              isValid &= modelData!.commonDetailsValid! &&
                                  modelData!.locationPageValid!;

                              for (var i
                                  in modelData!.individualDataListTransient) {
                                isValid &= i.dataValid!;
                              }

                              if (isValid) {
                                var userId = await getUserID;
                                modelData!.recordCollectingUserId = userId;
                                var progressContext;
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    progressContext = context;
                                    return WillPopScope(
                                        child: Dialog(
                                          child: Padding(
                                            padding: EdgeInsets.all(20),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 20),
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                new Text(
                                                  "Uploading data",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onWillPop: () async => false);
                                  },
                                );
                                try {
                                  http.Response res = await _makeRequest(
                                      modelData!.toJson(),
                                      "/api/IndividualData");
                                  if (res.statusCode != 201) {
                                    showToast(res.body);
                                  } else {
                                    Navigator.pop(context);
                                    showToast("Data entered successfully!");
                                  }
                                } catch (e) {
                                  showToast(
                                      "Something went wrong, please check your network connection or save your records to upload later",
                                      position: ToastPosition.center,
                                      backgroundColor: colors.darkAccentColor);
                                }
                                Navigator.of(progressContext!,
                                        rootNavigator: true)
                                    .pop();
                              } else {
                                showToast("Please fill all fields!");
                              }
                            }),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 10),
                        child: ElevatedButton(
                            child: Text("Save",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side:
                                            BorderSide(color: Colors.white)))),
                            onPressed: () async {
                              var userId = await getUserID;
                              modelData!.recordCollectingUserId = userId;
                              var store = await StoreInstance.getInstance();
                              Box individualDataBox =
                                  store.box<FamilyMemberIndividualDataModel>();

                              await individualDataBox.putMany(
                                  modelData!.individualDataListTransient);

                              modelData!.individualDataList.clear();
                              modelData!.individualDataList.addAll(
                                  modelData!.individualDataListTransient);

                              Box box =
                                  store.box<FamilyMembersCommonDataModel>();
                              int id = await box.put(modelData);

                              AlertDialog alertDialog = AlertDialog(
                                backgroundColor: colors.darkScaffoldColor,
                                title: Text(
                                  'Record Saved',
                                  style: GoogleFonts.poppins(
                                      color: colors.darkPrimaryTextColor),
                                ),
                                content: Text(
                                    'The Record has been saved with record ID ${id}',
                                    style: GoogleFonts.poppins(
                                        color: colors.darkPrimaryTextColor)),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog');
                                    },
                                    child: Text(
                                      'OK',
                                      style: GoogleFonts.poppins(
                                          color: colors.darkPrimaryTextColor),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        primary: colors.darkAccentColor),
                                  )
                                ],
                              );

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      alertDialog);
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    modelData!.individualDataListTransient.clear();
    modelData = null;
  }
}
