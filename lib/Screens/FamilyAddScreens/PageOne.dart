import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/DatePicker.dart';



class PageOne extends StatefulWidget {

  PageOne(this._formKey);

  final _formKey;

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Enter name:',textAlign: TextAlign.start,),
        Form(
          key: widget._formKey,
          child: Column(
        children: [
          TextFormField(
            validator: (value){
              if(value==null || value=='')
                return 'Enter a valid name';

              else{
                return null;
              }
            },
            autovalidateMode: AutovalidateMode.always,
          ),
          DatePicker(),
        ],
        )
        )
      ],
    );
  }
  

}

