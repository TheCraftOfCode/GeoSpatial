import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/NestedOptionsWidget.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

class NestedOptionWidgetFormField extends FormField<List<NestedOptionData>> {
  NestedOptionWidgetFormField(
      {FormFieldSetter<List<NestedOptionData>>? onSaved,
      FormFieldValidator<List<NestedOptionData>>? validator,
      Function(List<NestedOptionData>)? onChanged,
      required context,
      required String title,
      required List<NestedOptionData> nestedOptionData,
      AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction})
      : super(
            initialValue: nestedOptionData,
            onSaved: onSaved,
            validator: validator ??
                (data) {
                  bool isSelected = false;
                  for (var i in data!) {
                    print(i.boxName);
                    print(i.isSelected);
                    isSelected |= i.isSelected;
                  }
                  if (!isSelected) {
                    return "Please choose an option";
                  }
                  return null;
                },
            builder: (state) {
              getDisplayData() {
                if (state.hasError) {
                  return Text(
                    state.errorText ?? "Please choose a value",
                    style: GoogleFonts.poppins(color: colors.errorColor),
                  );
                } else {
                  var selectedOptions = [];
                  for (var i in state.value!) {
                    if (i.isSelected) selectedOptions.add(i.boxName);
                  }
                  if (selectedOptions.isNotEmpty) {
                    return Text(
                      selectedOptions.join(", "),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    );
                  } else {
                    return Text(
                      "Please choose a value",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    );
                  }
                }
              }

              return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(title,
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: colors.darkPrimaryTextColor)),
                    ),
                    Card(
                      elevation: 5,
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      color: colors.darkScaffoldColor,
                      child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NestedOptionWidget(
                                title: title,
                                onChanged: (val) {
                                  for (var i in val) {
                                    print(i.toJsonString());
                                    var decodedVal = NestedOptionData.fromJson(
                                        i.toJsonString());
                                  }
                                  state.didChange(val);
                                  state.validate();
                                },
                                nestedOptionData: state.value!,
                              ),
                            ));
                          },
                          //Pass a function which is called onSaved in the next page and add data to the class object
                          trailing: Icon(
                            Icons.arrow_right,
                            color: colors.darkSecondaryTextColor,
                          ),
                          title: getDisplayData()),
                    ),
                    state.hasError
                        ? Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              state.errorText ?? "error",
                              style: GoogleFonts.poppins(
                                  color: colors.errorColor, fontSize: 10),
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            });
}
