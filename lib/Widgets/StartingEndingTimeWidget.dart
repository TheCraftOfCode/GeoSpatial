import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

class StartingEndingTimeWidget extends FormField<List<TimeOfDay>> {
  StartingEndingTimeWidget(
      {FormFieldSetter<List<TimeOfDay>>? onSaved,
      FormFieldValidator<List<TimeOfDay>>? validator,
      label,
      initialValue,
      AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction})
      : super(
            onSaved: onSaved,
            validator: validator ??
                (data) {
                  if (data == null || data.isEmpty)
                    return "Please enter a value";
                  return null;
                },
            initialValue: initialValue ?? [TimeOfDay.now(), TimeOfDay.now()],
            autovalidateMode: autoValidateMode,
            builder: (FormFieldState<List<TimeOfDay>> state) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(label ?? "Choose Starting and Ending Time",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: colors.darkPrimaryTextColor)),
                    ),
                    Card(
                      color: colors.darkScaffoldColor,
                      elevation: 10,
                      margin: EdgeInsets.only(bottom: 4),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Column(
                          children: [
                            TimeBoxWidget(
                              timeMessage: "Starting Time: ",
                              state: state,
                              index: 0,
                            ),
                            TimeBoxWidget(
                              timeMessage: "Ending Time: ",
                              state: state,
                              index: 1,
                            )
                          ],
                        ),
                      ),
                    ),
                  ]);
            });
}

class TimeBoxWidget extends StatelessWidget {
  const TimeBoxWidget(
      {Key? key,
      required this.timeMessage,
      required this.state,
      required this.index})
      : super(key: key);

  final String timeMessage;
  final FormFieldState<List<TimeOfDay>> state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 1, child: Text(timeMessage)),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: colors.darkAccentColor),
            onPressed: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: state.value?.elementAt(index) ?? TimeOfDay.now(),
              );
              var list = state.value;
              list![index] = pickedTime!;
              state.didChange(list);
            },
            child: Text(
              "${state.value![index].hour}:${state.value![index].minute} ${state.value![index].period == DayPeriod.am ? "AM" : "PM"}",
              style: GoogleFonts.montserrat(
                  color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
        )
      ],
    );
  }
}
