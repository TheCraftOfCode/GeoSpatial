import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

class DropDownFormField extends FormField<dynamic> {
  DropDownFormField(
      {FormFieldSetter<dynamic>? onSaved,
      FormFieldValidator<dynamic>? validator,
      required list,
      required title,
      required hint,
      String? defaultValue,
      errorField,
      AutovalidateMode autoValidateMode = AutovalidateMode.disabled})
      : super(
            onSaved: onSaved,
            validator: validator ??
                (data) {
                  if (data == null)
                    return errorField ?? "Please select a value";
                  return null;
                },
            initialValue: defaultValue,
            autovalidateMode: autoValidateMode,
            builder: (FormFieldState<dynamic> state) {
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
                      color: colors.darkScaffoldColor,
                      elevation: 10,
                      margin: EdgeInsets.only(bottom: 4),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<dynamic>(
                            dropdownColor: colors.darkScaffoldColor,
                            value: state.value,
                            isExpanded: true,
                            items: list.map<DropdownMenuItem>((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Container(
                                  color: colors.darkScaffoldColor,
                                  child: Text(
                                    value,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  padding: EdgeInsets.only(left: 8),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              state.didChange(newValue);
                            },
                            hint: Container(
                              color: colors.darkScaffoldColor,
                              padding: EdgeInsets.all(8),
                              child: Text(
                                hint,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: state.hasError
                                        ? Colors.red
                                        : Colors.grey),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            style: GoogleFonts.poppins(
                                color: colors.darkPrimaryTextColor,
                                decorationColor: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    state.hasError
                        ? Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              state.errorText ?? "error",
                              style: GoogleFonts.poppins(
                                  color: Colors.red, fontSize: 10),
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            });
}