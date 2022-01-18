import 'dart:convert';

import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/CheckBoxAddExtraDialog.dart';
import 'package:google_fonts/google_fonts.dart';

class NestedOptionData {
  bool isSelected = false;
  Map<String, bool>? subOptionDataMap;
  String? boxName;

  NestedOptionData({this.subOptionDataMap, this.boxName});

  toJsonString() {
    return json.encode({
      "isSelected": isSelected,
      "boxName": boxName,
      "selectedData": json.encode(subOptionDataMap),
    });
  }

  factory NestedOptionData.fromJson(String jsonObject) {
    var decodedJson = json.decode(jsonObject);
    var nestedDataObject = NestedOptionData();
    nestedDataObject.boxName = decodedJson['boxName'] as String;
    nestedDataObject.isSelected = decodedJson['isSelected'] as bool;
    nestedDataObject.subOptionDataMap =
        Map<String, bool>.from(json.decode(decodedJson["selectedData"]));
    return nestedDataObject;
  }
}

class NestedOptionWidget extends StatefulWidget {
  const NestedOptionWidget(
      {Key? key, required this.nestedOptionData, this.onChanged, this.title})
      : super(key: key);

  final List<NestedOptionData> nestedOptionData;
  final String? title;
  final Function(List<NestedOptionData>)? onChanged;

  @override
  _NestedOptionWidgetState createState() => _NestedOptionWidgetState();
}

class _NestedOptionWidgetState extends State<NestedOptionWidget> {
  var selectedColor = Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButton(widget.title ?? "Select Options"),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: colors.darkSecondBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color(0xBC252426),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(0),
            child: ListView.builder(
                itemCount: widget.nestedOptionData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Card(
                            elevation: 10,
                            color: colors.darkScaffoldColor,
                            child: CheckboxListTile(
                                activeColor: colors.darkAccentColor,
                                value:
                                    widget.nestedOptionData[index].isSelected,
                                title: Text(
                                  widget.nestedOptionData[index].boxName!,
                                  style: GoogleFonts.poppins(
                                      color: selectedColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18),
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    // for (var i in widget.nestedOptionData) {
                                    //   i.isSelected = false;
                                    // }
                                    widget.nestedOptionData[index].isSelected =
                                        val!;
                                  });
                                  if (widget.onChanged != null)
                                    widget.onChanged!(widget.nestedOptionData);
                                }),
                          ),
                          widget.nestedOptionData[index].isSelected
                              ? Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: colors.darkSecondAccentColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  child: CheckBoxAddExtraAlertDialog(
                                      hint: "hint",
                                      autoSave: true,
                                      onSaved: (map) {
                                        widget.nestedOptionData[index]
                                            .subOptionDataMap = map!;
                                        if (widget.onChanged != null)
                                          widget.onChanged!(
                                              widget.nestedOptionData);
                                      },
                                      dataMap: widget.nestedOptionData[index]
                                          .subOptionDataMap!,
                                      context: context),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
