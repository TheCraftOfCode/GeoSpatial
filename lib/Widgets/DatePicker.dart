import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  DateTime date = DateTime.now();

  String getText() {
    if (date == null) {
      return 'Pick date';
    }

    else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        child: Text(getText()),
        onPressed: () {
          pickDate(context);
        },
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context, initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }
}