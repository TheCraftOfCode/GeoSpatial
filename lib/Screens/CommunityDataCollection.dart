import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Utils/Constants.dart';
import 'package:geo_spatial/Model/CommunityDataModel.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/StoreInstance.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/LocationWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

final storage = FlutterSecureStorage();

_getUserID() async {
  var userData = await storage.read(key: USER_DATA_KEY);
  if (userData == null) return "";

  var dataJson = json.decode(userData);
  print("dataJson ${dataJson} ${userData}");
  return dataJson[0]["username"];
}

class CommunityDataCollection extends StatefulWidget {
  CommunityDataCollection({Key? key, CommunityDataModel? this.modelData})
      : super(key: key);

  final modelData;
  final List<String> _publicResourceList = [
    'Temple',
    'Church',
    'Mosque',
    'Community hall',
    'Community toilet',
    'Anganwadi centre',
    'Schools',
    'Colleges',
    'Market',
    'Wine shops',
    'PHC',
    'PDS',
    'Petty shops',
    'Whole sale shops',
    'Retail shops',
    'Vegetable shops',
    'Bakeries',
    'Hotels',
    'Food processing units'
  ];

  //TODO: Replace with list of village codes

  final List<String> _villageCodeName = [
    'THC',
    'PGP',
    'AMC',
    'KUP',
    'KAP',
    'NEP',
    'CGP',
    'JJN'
  ];

  @override
  _CommunityDataCollectionState createState() =>
      _CommunityDataCollectionState();
}

class _CommunityDataCollectionState extends State<CommunityDataCollection> {
  int count = 0;
  late CommunityDataModel modelData;
  var store;

  Future<String> jwtToken() async {
    var jwt = await storage.read(key: JWT_STORAGE_KEY);
    print(JWT_STORAGE_KEY + jwt.toString());

    if (jwt == null) return "";
    return jwt;
  }

  Future<http.Response> _makeRequest(var data, String node) async {
    String url = NETWORK_ADDRESS;
    var body = json.encode(data);

    var jwt = await jwtToken();

    var res = await http
        .post(Uri.https(url, node),
            headers: {
              "Content-Type": "application/json",
              "user-auth-token": jwt
            },
            body: body)
        .timeout(
      const Duration(seconds: 10),
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
    modelData = widget.modelData ?? new CommunityDataModel();

    _onSubmit(bool isValid) async {
      print("All data valid");
      print(isValid.toString());

      if (isValid) {
        try {
          http.Response res = await _makeRequest(
              modelData.toJson(), "/api/addCommunityBuilding");
          if (res.statusCode != 201) {
            showToast(res.body);
          } else {
            Navigator.pop(context);
            showToast("Data entered successfully!");
          }
        } catch (e) {
          print(e);
          showToast(
              "Something went wrong, please check your network connection or save your records to upload later",
              position: ToastPosition.center,
              backgroundColor: colors.darkAccentColor);
        }
      } else {
        showToast("Please fill all fields!");
      }
    }

    _onSave() async {
      print("CLICKED");
      var userId = await _getUserID();
      modelData.recordCollectingUserId = userId;

      store = await StoreInstance.getInstance();
      final box = store.box<CommunityDataModel>();
      int id = await box.putAsync(modelData);
      print("Entering data at id ${id}");

      AlertDialog alertDialog = AlertDialog(
        backgroundColor: colors.darkScaffoldColor,
        title: Text(
          'Record Saved',
          style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
        ),
        content: Text('The record has been saved with record ID ${id}',
            style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor)),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: colors.darkAccentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
            },
            child: Text(
              'OK',
              style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
            ),
          )
        ],
      );

      showDialog(
          context: context, builder: (BuildContext context) => alertDialog);
    }

    return WillPopScope(
      onWillPop: () async {
        final result = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: colors.darkScaffoldColor,
            title: Text(
              "Are you sure?",
              style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
            ),
            content: Text(
              "All unsaved changes will be lost.",
              style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'No',
                  style:
                      GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
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
                  Navigator.pop(context, true);
                },
              ),
            ],
          ),
        );
        return result;
      },
      child: Scaffold(
        backgroundColor: colors.darkScaffoldColor,
        appBar: AppBarBackButton('Community Data'),
        body: SingleChildScrollView(
          child: FormPageView(
            [
              DropDownFormField(
                  defaultValue: modelData.resourceType,
                  list: widget._publicResourceList,
                  onSaved: (data) {
                    print(data);
                    modelData.resourceType = data;
                  },
                  title: "Choose type of resource to tag",
                  hint: "Select resource type",
                  errorField: "Please choose a resource to tag"),
              LocationWidgetField(
                title: "Record location at top left part of the facility",
                defaultValue: modelData.locationTopLeft,
                context: context,
                onSaved: (data) {
                  print(data);
                  modelData.locationTopLeft = data;
                },
              ),
              LocationWidgetField(
                title: "Record location at top right part of the facility",
                defaultValue: modelData.locationTopRight,
                context: context,
                onSaved: (data) {
                  print(data);
                  modelData.locationTopRight = data;
                },
              ),
              LocationWidgetField(
                title: "Record location at bottom left part of the facility",
                defaultValue: modelData.locationBottomLeft,
                context: context,
                onSaved: (data) {
                  print(data);
                  modelData.locationBottomLeft = data;
                },
              ),
              LocationWidgetField(
                title: "Record location at bottom right part of the facility",
                defaultValue: modelData.locationBottomRight,
                context: context,
                onSaved: (data) {
                  print(data);
                  modelData.locationBottomRight = data;
                },
              ),
              DropDownFormField(
                  defaultValue: modelData.villageCode,
                  list: widget._villageCodeName,
                  onSaved: (data) {
                    print(data);
                    modelData.villageCode = data;
                  },
                  title: "Choose Village Code",
                  hint: "Select Village Code",
                  errorField: "Please choose a village code"),
            ],
            _onSubmit,
            submitMessage:
                "Submit record to server or Save record locally for later editing",
            saveData: _onSave,
            note:
                "Note: Saving existing records will over-write the record and not create new one",
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
