import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

class DatePickerWidget extends FormField<DateTime> {
  DatePickerWidget(
      {FormFieldSetter<DateTime>? onSaved,
      FormFieldValidator<DateTime>? validator,
      DateTime? defaultDate,
      required context,
      hint = 'Please choose a date',
      title,
      AutovalidateMode autoValidateMode = AutovalidateMode.disabled})
      : super(
            onSaved: onSaved,
            validator: validator ??
                (data) {
                  if (data == null) return "Please choose date";
                  return null;
                },
            initialValue: defaultDate ?? null,
            autovalidateMode: autoValidateMode,
            builder: (FormFieldState<DateTime> state) {
              Future pickDate(BuildContext context) async {
                final initialDate = state.value ?? DateTime.now();
                final newDate = await showDatePicker(
                  context: context,
                  initialDate: initialDate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  initialDatePickerMode: DatePickerMode.year,
                );

                if (newDate != null) state.didChange(newDate);
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(title ?? 'Choose date',
                        style: GoogleFonts.montserrat(
                            fontSize: 20, color: Colors.white)),
                  ),
                  Card(
                    color: colors.darkScaffoldColor,
                    elevation: 6,
                    margin: EdgeInsets.only(bottom: 4),
                    child: InkWell(
                      onTap: () {
                        pickDate(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 15, bottom: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20, left: 10),
                              child: Icon(Icons.calendar_today),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                  state.value == null
                                      ? hint
                                      : '${state.value!.day} / ${state.value!.month} / ${state.value!.year}',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 17,
                                      color: state.hasError
                                          ? Colors.red
                                          : Colors.grey)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  state.hasError
                      ? Container(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            state.errorText ?? "error",
                            style: TextStyle(color: Colors.red, fontSize: 10),
                          ),
                        )
                      : Container()
                ],
              );
            });
}
