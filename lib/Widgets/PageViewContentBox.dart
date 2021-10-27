import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///Card to hold content of DataCollecting PageView, has left and right buttons
///Pass method to control viewpage to respective method parameters (left and right)
///Pass null to hide button

class PageViewContentBox extends StatelessWidget {
  const PageViewContentBox(
      this.centerWidget,
      {Key? key}) : super(key: key);

  final Widget centerWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xBC674E6F),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Center(
                child: centerWidget,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
