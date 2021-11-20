import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Utils/DarkTheme.dart';

class PageViewContentBox extends StatelessWidget {
  const PageViewContentBox(this.centerWidget, {Key? key}) : super(key: key);

  final Widget centerWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: darkTheme.DarkTheme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: Color(0xBC252426),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: centerWidget,
          ),
        ),
      );
  }
}
