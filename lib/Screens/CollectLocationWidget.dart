import 'package:flutter/material.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/LocationWidget.dart';

class CollectLocationWidget extends StatefulWidget {
  const CollectLocationWidget({Key? key, this.modelData}) : super(key: key);
  final modelData;

  @override
  _CollectLocationWidgetState createState() => _CollectLocationWidgetState();
}

class _CollectLocationWidgetState extends State<CollectLocationWidget> {
  @override
  Widget build(BuildContext context) {
    _onSubmit(bool isValid) async {
      print("All data valid");
      print(isValid.toString());

      if (isValid) {
        print("Valid!");
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Please fill all fields!",
            style: TextStyle(color: Colors.red),
          ),
        ));
      }
    }

    return Scaffold(
        backgroundColor: colors.darkScaffoldColor,
        appBar: AppBarBackButton('Get Location'),
        body: FormPageView(
          [
            LocationWidgetField(
                title: "Record location at top left part of the facility",
                context: context,
                defaultValue: widget.modelData.locationTopLeft,
                onSaved: (data) {
                  print(data);
                  widget.modelData.locationTopLeft = data;
                },
                autoValidateMode: AutovalidateMode.disabled),
            LocationWidgetField(
                title: "Record location at top right part of the facility",
                context: context,
                defaultValue: widget.modelData.locationTopRight,
                onSaved: (data) {
                  print(data);
                  widget.modelData.locationTopRight = data;
                },
                autoValidateMode: AutovalidateMode.disabled),
            LocationWidgetField(
                title: "Record location at bottom left part of the facility",
                context: context,
                defaultValue: widget.modelData.locationBottomLeft,
                onSaved: (data) {
                  print(data);
                  widget.modelData.locationBottomLeft = data;
                },
                autoValidateMode: AutovalidateMode.disabled),
            LocationWidgetField(
                title: "Record location at bottom right part of the facility",
                context: context,
                defaultValue: widget.modelData.locationBottomRight,
                onSaved: (data) {
                  print(data);
                  widget.modelData.locationBottomRight = data;
                },
                autoValidateMode: AutovalidateMode.disabled),
          ],
          _onSubmit,
          submitMessage:
              "Submit to Continue or go back to re-record location data",
        ));
  }
}
