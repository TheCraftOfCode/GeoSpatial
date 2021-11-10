import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/LocationWidget.dart';
import 'package:geolocator/geolocator.dart';

class CommunityDataCollection extends StatefulWidget {
  const CommunityDataCollection({Key? key}) : super(key: key);

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
        LocationWidgetField(
            context: context,
            onSaved: (data) {
              print(data);
            },
            autoValidateMode: AutovalidateMode.disabled),
        LocationWidgetField(
            context: context,
            onSaved: (data) {
              print(data);
            },
            autoValidateMode: AutovalidateMode.disabled),
        LocationWidgetField(
            context: context,
            onSaved: (data) {
              print(data);
            },
            autoValidateMode: AutovalidateMode.disabled),
        LocationWidgetField(
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
        Text('Haha Hi')
      ], _onSubmit),
    );
  }
}
