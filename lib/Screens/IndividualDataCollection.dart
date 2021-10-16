import 'package:flutter/material.dart';

class IndividualDataCollection extends StatefulWidget {
  const IndividualDataCollection({Key? key}) : super(key: key);

  @override
  _IndividualDataCollectionState createState() => _IndividualDataCollectionState();
}

class _IndividualDataCollectionState extends State<IndividualDataCollection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Individual Data'),
        ),
      ),
    );
  }
}
