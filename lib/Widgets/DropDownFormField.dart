import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownFormField extends FormField<dynamic> {
  DropDownFormField(
      {FormFieldSetter<dynamic>? onSaved,
      FormFieldValidator<dynamic>? validator,
      required list,
      required title,
      required hint,
      required subTitle,
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
            initialValue: null,
            autovalidateMode: autoValidateMode,
            builder: (FormFieldState<dynamic> state) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(title,
                          style: GoogleFonts.montserrat(
                              fontSize: 25, color: Colors.black)),
                    ),
                    Card(
                      elevation: 2,
                      margin: EdgeInsets.only(bottom: 4),
                      child: ListTile(
                        title: Text(
                          subTitle,
                          style: GoogleFonts.montserrat(color: Colors.black),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        trailing: DropdownButtonHideUnderline(
                          child: DropdownButton<dynamic>(
                            value: state.value,
                            isExpanded: false,
                            items: list.map<DropdownMenuItem>((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              state.didChange(newValue);
                            },
                            hint: Container(
                              width: 150, //and here
                              child: Text(
                                hint,
                                style: TextStyle(
                                    color: state.hasError
                                        ? Colors.red
                                        : Colors.grey),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            style: TextStyle(
                                color: Colors.black,
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
                              style: TextStyle(color: Colors.red, fontSize: 10),
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            });
}
