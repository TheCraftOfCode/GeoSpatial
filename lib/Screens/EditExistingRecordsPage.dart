import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';

class EditRecordsScreen extends StatelessWidget {
  const EditRecordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButton('Edit Existing Data'),
      body: Container(),
    );
  }
}
