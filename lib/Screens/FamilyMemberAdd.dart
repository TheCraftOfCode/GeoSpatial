import 'package:flutter/material.dart';

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
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the name';
                      }
                      return null;
                    },
                  ),
                  OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() == true) {
                          print('Form submitted successfully');
                          //TODO: Add logic to store locally and to lazy upload to database
                        }
                      },
                      child: Text('Submit'))
                ],
              ))
        ],
      ),
    ));
  }
}
