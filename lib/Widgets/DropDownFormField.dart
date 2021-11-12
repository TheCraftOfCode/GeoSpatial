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
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(title,
                          style: GoogleFonts.montserrat(
                              fontSize: 25, color: Colors.black)),
                    ),
                    Card(
                      elevation: 2,
                      margin: EdgeInsets.only(bottom: 4),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                          value: state.value,
                          isExpanded: true,
                          items: list.map<DropdownMenuItem>((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Container(
                                child: Text(
                                  value,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                padding: EdgeInsets.all(8),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            state.didChange(newValue);
                          },
                          hint: Container(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              hint,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: state.hasError
                                      ? Colors.red
                                      : Colors.grey),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          style: TextStyle(
                              color: Colors.black, decorationColor: Colors.red),
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
