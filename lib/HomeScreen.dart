import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient : LinearGradient(
            begin: Alignment(-0.2401895672082901,0.7598104476928711),
            end: Alignment(-0.7598104476928711,-0.7598104476928711),
            colors: [Color.fromRGBO(255, 0, 229, 0.7599999904632568),Color.fromRGBO(255, 0, 0, 0.6000000238418579)]
        ),
      ),
    child: Text(')',)
    );
  }
}
