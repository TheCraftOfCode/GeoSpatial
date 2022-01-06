import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geo_spatial/Model/FamilyMembersCommonDataModel.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/LocationWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectLocationWidget extends StatefulWidget {
  const CollectLocationWidget({Key? key, this.modelData}) : super(key: key);
  final FamilyMembersCommonDataModel? modelData;

  @override
  _CollectLocationWidgetState createState() => _CollectLocationWidgetState();
}

class _CollectLocationWidgetState extends State<CollectLocationWidget> {
  @override
  Widget build(BuildContext context) {
    _onSubmit(bool isValid) async {
      if (isValid) {
        print("Valid!");
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: AutoSizeText(
            "Please fill all fields!",
            style: GoogleFonts.poppins(color: colors.errorColor),
          ),
        ));
      }
    }

    return WillPopScope(
      onWillPop: () async {
        final result = await showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: AutoSizeText("Are you sure?"),
                content: AutoSizeText("All unsaved changes would be lost"),
                actions: <Widget>[
                  TextButton(
                    child: AutoSizeText('No'),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                  TextButton(
                    child: AutoSizeText('Yes', style: TextStyle(color: Colors.red)),
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
          appBar: AppBarBackButton('Get Location'),
          body: SingleChildScrollView(
            child: FormPageView(
                [
                  LocationWidgetField(
                    title: "Record location at top left part of the facility",
                    context: context,
                    defaultValue: widget.modelData?.locationTopLeft,
                    onSaved: (data) {
                      print(data);
                      widget.modelData?.locationTopLeft = data;
                    },
                  ),
                  LocationWidgetField(
                    title: "Record location at top right part of the facility",
                    context: context,
                    defaultValue: widget.modelData?.locationTopRight,
                    onSaved: (data) {
                      print(data);
                      widget.modelData?.locationTopRight = data;
                    },
                  ),
                  LocationWidgetField(
                    title: "Record location at bottom left part of the facility",
                    context: context,
                    defaultValue: widget.modelData?.locationBottomLeft,
                    onSaved: (data) {
                      print(data);
                      widget.modelData?.locationBottomLeft = data;
                    },
                  ),
                  LocationWidgetField(
                    title: "Record location at bottom right part of the facility",
                    context: context,
                    defaultValue: widget.modelData?.locationBottomRight,
                    onSaved: (data) {
                      print(data);
                      widget.modelData?.locationBottomRight = data;
                    },
                  ),
                ],
                _onSubmit,
                onChange: (isValid){
                  print("IS LOCATION VALID: ${widget.modelData?.locationPageValid}");
                  widget.modelData?.locationPageValid = isValid;
                },
                submitMessage:
                "Submit to Continue or go back to re-record location data",
                note: "The entered fields are automatically saved when moving to next page and doesn't require submit to be clicked to save",

            ),
          )),
    );
  }
}
