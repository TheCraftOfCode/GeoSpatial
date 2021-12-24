import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

/**
 * Widget for steps count in registration pages
 *
 * @param:
 * int totalSteps: Total number of steps in registration
 * int currentStep: Current position of registration
 *
 * @returns:
 * Widget: Returns a StepProgressIndicator
 */

class StepCounterWidget extends StatefulWidget {
  const StepCounterWidget(
      this.totalSteps, this.currentStep, this.errorArray, this.controller,
      {Key? key})
      : super(key: key);

  final int totalSteps;
  final int currentStep;
  final List<bool> errorArray;
  final PageController controller;

  @override
  _StepCounterWidgetState createState() => _StepCounterWidgetState();
}

class _StepCounterWidgetState extends State<StepCounterWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> checkBoxWidgetList = [];

    for (int i = 0; i < widget.totalSteps; i++) {
      if (i == widget.totalSteps - 1) {
        if (i == widget.currentStep) {
          checkBoxWidgetList.add(CheckBox(5, widget.controller, i));
        } else {
          checkBoxWidgetList.add(CheckBox(4, widget.controller, i));
        }
      } else if (i < widget.currentStep) {
        try {
          widget.errorArray[i]
              ? checkBoxWidgetList.add(CheckBox(0, widget.controller, i))
              : checkBoxWidgetList.add(CheckBox(1, widget.controller, i));
          print(widget.errorArray[i].toString() + " " + i.toString());
        } catch (error) {
          checkBoxWidgetList.add(CheckBox(1, widget.controller, i));
        }
      } else if (i == widget.currentStep) {
        checkBoxWidgetList.add(CheckBox(2, widget.controller, i));
      } else {
        checkBoxWidgetList.add(CheckBox(3, widget.controller, i));
      }
    }

    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: checkBoxWidgetList,
      ),
    );
  }
}

class CheckBox extends StatelessWidget {
  const CheckBox(this.iconType, this.controller, this.tilePosition, {Key? key})
      : super(key: key);
  final int iconType;
  final PageController controller;
  final int tilePosition;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color iconColor;
    Color backgroundColor;

    if (iconType == 0) {
      icon = Icons.close;
      backgroundColor = Color.fromARGB(255, 255, 167, 167);
      iconColor = Colors.red;
    } else if (iconType == 1) {
      icon = Icons.check;
      iconColor = Colors.white;
      backgroundColor = Color(0xff7bde27);
    } else if (iconType == 2) {
      icon = Icons.remove;
      iconColor = Color.fromARGB(255, 255, 255, 255);
      backgroundColor = colors.darkAccentColor;
    } else if (iconType == 3) {
      icon = Icons.remove;
      iconColor = Color.fromARGB(255, 0, 0, 0);
      backgroundColor = colors.darkSecondAccentColor;
    } else if (iconType == 4) {
      icon = Icons.upload_rounded;
      iconColor = Color.fromARGB(255, 255, 255, 255);
      backgroundColor = colors.darkSecondAccentColor;
    } else {
      icon = Icons.upload_rounded;
      iconColor = Color.fromARGB(255, 255, 255, 255);
      backgroundColor = colors.darkSecondAccentColor;
    }
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
      ),
      margin: EdgeInsets.only(left: 3.0, right: 3.0),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        color: backgroundColor,
        child: InkWell(
          onTap: () {
            controller.animateToPage(
              tilePosition,
              curve: Curves.ease,
              duration: Duration(milliseconds: 650),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ),
      ),
    ));
  }
}
