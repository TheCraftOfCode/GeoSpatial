import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  const StepCounterWidget(this.totalSteps, this.currentStep, this.errorArray,
      {Key? key})
      : super(key: key);

  final int totalSteps;
  final int currentStep;
  final List<bool> errorArray;

  @override
  _StepCounterWidgetState createState() => _StepCounterWidgetState();
}

class _StepCounterWidgetState extends State<StepCounterWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> checkBoxWidgetList = [];

    for (int i = 0; i < widget.totalSteps; i++) {
      if (i < widget.currentStep) {
        try {
          widget.errorArray[i]
              ? checkBoxWidgetList.add(CheckBox(0))
              : checkBoxWidgetList.add(CheckBox(1));
          print(widget.errorArray[i].toString() + " " + i.toString());
        } catch (error) {
          checkBoxWidgetList.add(CheckBox(1));
        }
      } else {
        checkBoxWidgetList.add(CheckBox(2));
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
  const CheckBox(this.iconType, {Key? key}) : super(key: key);
  final int iconType;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color iconColor;
    Color backgroundColor;

    if (iconType == 0) {
      icon = Icons.close;
      iconColor = Color.fromARGB(255, 255, 205, 205);
      backgroundColor = Colors.red;
    } else if (iconType == 1) {
      icon = Icons.check;
      iconColor = Colors.white;
      backgroundColor = Color.fromARGB(250, 157, 133, 244);
    } else {
      icon = Icons.remove;
      iconColor = Color.fromARGB(255, 0, 0, 0);
      backgroundColor = Color.fromARGB(250, 213, 201, 255);
    }
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(left: 3.0, right: 3.0),
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      color: backgroundColor,
    ));
  }
}
