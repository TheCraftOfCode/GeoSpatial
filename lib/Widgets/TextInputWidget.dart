import 'package:flutter/material.dart';


class TextInputWidget extends StatelessWidget {


  TextInputWidget(this._formKey,this.validator);

  final _formKey;
  final validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _formKey,
      validator: validator,
      onChanged: (err){_formKey.currentState!.validate();},
    );
  }
}

