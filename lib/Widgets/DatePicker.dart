import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class DatePicker extends StatefulWidget {


  DatePicker(this.title);

  String title;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  @override
  void initState(){
    super.initState();
  }

  DateTime date = DateTime.now();

  var textFieldController = TextEditingController();

  String getText() {
    if (date == "") {
      return 'Pick date';
    }

    else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      child: TextField(
        decoration: InputDecoration(
          label: Text(widget.title),
        ),
        controller: textFieldController,
        onTap: () {
          pickDate(context);
        },

      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showRoundedDatePicker(
      context: context, initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
      borderRadius: 16
    );

    if (newDate == null) return;

    setState(() => date = newDate);
    textFieldController.text = getText();
  }
}