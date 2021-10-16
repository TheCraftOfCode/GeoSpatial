import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _IndividualDataCollectionState createState() => _IndividualDataCollectionState();
}

class _IndividualDataCollectionState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
