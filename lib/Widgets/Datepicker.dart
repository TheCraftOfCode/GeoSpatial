import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Datepicker extends StatefulWidget {
  const Datepicker({Key? key}) : super(key: key);

  @override
  _Datepickerstate createState() => _Datepickerstate();
}

class _Datepickerstate extends State<Datepicker> {

  late DateTime date;

  String getText(){

    if(date==null){
      return 'Pick date';
    }

    else{
      return '${date.month}/${date.day}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: OutlinedButton(
        child: Text(getText()),
        onPressed: (){ pickDate(context);},
      ),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(context: context, initialDate: initialDate,
    firstDate: DateTime(DateTime.now().year-100),
    lastDate: DateTime(DateTime.now().year),
    );

    if(newDate == null) return;

    setState(() => date = newDate);
  }
}
