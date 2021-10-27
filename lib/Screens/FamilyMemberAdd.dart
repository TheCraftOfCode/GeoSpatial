import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DatePicker.dart';

class FamilyMemberAdd extends StatefulWidget {
  const FamilyMemberAdd({Key? key}) : super(key: key);

  @override
  _FamilyMemberAddState createState() => _FamilyMemberAddState();
}

class _FamilyMemberAddState extends State<FamilyMemberAdd> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButton('Add Family Member'),
        body: SafeArea(
          child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,top: 80,right: 20.0),
        child: Column(
            children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle:
                            TextStyle(color: Colors.deepPurpleAccent, fontSize: 14.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the name';
                          }
                          return null;
                        },
                      ),
                      DatePicker(),
                      OutlinedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate() == true) {
                              print('Form submitted successfully');
                              //TODO: Add logic to store locally and to lazy upload to database
                            }
                          },
                          child: Text('Submit'))
                    ],
                  ),
              ),

            ],
        ),
      ),
    ),
        ));
  }
}
