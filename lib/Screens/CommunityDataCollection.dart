import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Model/CommunityDataModel.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/LocationWidget.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

class CommunityDataCollection extends StatefulWidget {
  CommunityDataCollection({Key? key, CommunityDataModel? this.modelData}) : super(key: key);

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

  final List<String> _villageCodeName = [
    'Temple',
    'Church',
    'Mosque',
  ];

  @override
  _CommunityDataCollectionState createState() =>
      _CommunityDataCollectionState();
}

class _CommunityDataCollectionState extends State<CommunityDataCollection> {
  int count = 0;
  final PageController controller = PageController(initialPage: 0);

  final List<GlobalObjectKey<FormState>> formKeyList =
      List.generate(3, (index) => GlobalObjectKey<FormState>(index));



  @override
  Widget build(BuildContext context) {
    CommunityDataModel modelData = widget.modelData ?? CommunityDataModel();

    _onSubmit(bool isValid) {
      print("All data valid");
      print(isValid.toString());

      if(isValid){
        print("Valid!");
        print(modelData.villageCode);
        print(modelData.locationBottomRight);
        print(modelData.locationBottomLeft);
        print(modelData.locationTopRight);
        print(modelData.locationTopLeft);
        print(modelData.resourceType);

        //TODO: Send data to server from here
      }
    }

    return Scaffold(
      backgroundColor: colors.darkScaffoldColor,
      appBar: AppBarBackButton('Community Data'),
      body: FormPageView([
        DropDownFormField(
          defaultValue: modelData.resourceType,
            list: widget._publicResourceList,
            onSaved: (data){
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
            autoValidateMode: AutovalidateMode.disabled),
        LocationWidgetField(
            title: "Record location at top right part of the facility",
            defaultValue: modelData.locationTopRight,
            context: context,
            onSaved: (data) {
              print(data);
              modelData.locationTopRight = data;

            },
            autoValidateMode: AutovalidateMode.disabled),
        LocationWidgetField(
            title: "Record location at bottom left part of the facility",
            defaultValue: modelData.locationBottomLeft,
            context: context,
            onSaved: (data) {
              print(data);
              modelData.locationBottomLeft = data;

            },
            autoValidateMode: AutovalidateMode.disabled),
        LocationWidgetField(
            title: "Record location at bottom right part of the facility",
            defaultValue: modelData.locationBottomRight,
            context: context,
            onSaved: (data) {
              print(data);
              modelData.locationBottomRight = data;

            },
            autoValidateMode: AutovalidateMode.disabled),
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
      ], _onSubmit),
    );
  }
}
