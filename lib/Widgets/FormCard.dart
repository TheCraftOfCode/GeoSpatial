import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  FormCard(this._usernameController, this._passwordController, this._nameError,
      this._passwordError);

  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final _nameError;
  final _passwordError;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Login",
                style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 0.8,
                    color: Colors.deepPurpleAccent)),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  labelText: "Username",
                  errorText: _nameError,
                  labelStyle:
                      TextStyle(color: Colors.deepPurpleAccent, fontSize: 14.0),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  errorText: _passwordError,
                  labelStyle:
                      TextStyle(color: Colors.deepPurpleAccent, fontSize: 14.0),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
