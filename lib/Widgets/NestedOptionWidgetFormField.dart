import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/NestedOptionsWidget.dart';
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
              return Card(
                elevation: 5,
                margin: EdgeInsets.only(top: 3, bottom: 3),
                color: colors.darkScaffoldColor,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NestedOptionWidget(
                        title: "Select your options",
                        onChanged: (val) {
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
                  title: state.hasError
                      ? Text(
                          state.errorText ?? "Please choose a value",
                          style: GoogleFonts.poppins(color: colors.errorColor),
                        )
                      : Text(
                          "NO error",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                ),
              );
              ;
            });
}
