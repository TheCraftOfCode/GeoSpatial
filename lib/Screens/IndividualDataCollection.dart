import 'package:flutter/material.dart';

class IndividualDataCollection extends StatefulWidget {
  const IndividualDataCollection({Key? key}) : super(key: key);

  @override
  _IndividualDataCollectionState createState() =>
      _IndividualDataCollectionState();
}

class _IndividualDataCollectionState extends State<IndividualDataCollection> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Text('Individual Data'),
        ),
      );
  }
}
