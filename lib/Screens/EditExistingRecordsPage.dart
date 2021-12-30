import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/CheckBoxAddExtraDialog.dart';

class EditRecordsScreen extends StatelessWidget {
  const EditRecordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButton('Edit Existing Data'),
      body: Container(
        child: CheckBoxAddExtraAlertDialog(
          onSaved: (data) {
          },
          context: context,
          showAddNewBox: true, //show or hide textbox to add new field
          title: "Title",
          hint: "hey",
          dataMap: {"One": false, "Two": false},
        ),
      ),
    );
  }
}
