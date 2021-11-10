import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/LocationWidget.dart';

class CommunityDataCollection extends StatefulWidget {
  CommunityDataCollection({Key? key}) : super(key: key);

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

  @override
  _CommunityDataCollectionState createState() =>
      _CommunityDataCollectionState();
}

class _CommunityDataCollectionState extends State<CommunityDataCollection> {
  int count = 0;
  final PageController controller = PageController(initialPage: 0);

  final List<GlobalObjectKey<FormState>> formKeyList =
      List.generate(3, (index) => GlobalObjectKey<FormState>(index));

  _onSubmit(bool isValid) {
    print(isValid.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAE7FA),
      appBar: AppBarBackButton('Community Data'),
      body: FormPageView([
        DropDownFormField(
            list: widget._publicResourceList,
            title: "Choose type of resource to tag",
            hint: "Select resource type",
            subTitle: "Resource",
            errorField: "Please choose a resource to tag"),
        LocationWidgetField(
            title: "Record location at top left part of the facility",
            context: context,
            onSaved: (data) {
              print(data);
            },
            autoValidateMode: AutovalidateMode.disabled),
        LocationWidgetField(
            title: "Record location at top right part of the facility",
            context: context,
            onSaved: (data) {
              print(data);
            },
            autoValidateMode: AutovalidateMode.disabled),
        LocationWidgetField(
            title: "Record location at bottom left part of the facility",
            context: context,
            onSaved: (data) {
              print(data);
            },
            autoValidateMode: AutovalidateMode.disabled),
        LocationWidgetField(
            title: "Record location at bottom right part of the facility",
            context: context,
            onSaved: (data) {
              print(data);
            },
            autoValidateMode: AutovalidateMode.disabled),
        TextFormField(
          decoration: InputDecoration(),
          validator: (str) {
            if (str == '')
              return 'Enter field lmao';
            else
              return null;
          },
        ),
      ], _onSubmit),
    );
  }
}
