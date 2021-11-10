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
      if (i < widget.currentStep) {
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
    Border border;

    if (iconType == 0) {
      icon = Icons.close;
      backgroundColor = Color.fromARGB(255, 255, 167, 167);
      iconColor = Colors.red;
      border = Border.all(width: 1.5, color: Colors.red);
    } else if (iconType == 1) {
      icon = Icons.check;
      iconColor = Colors.white;
      backgroundColor = Color.fromARGB(250, 157, 133, 244);
      border = Border.all(width: 0, color: backgroundColor);
    } else if (iconType == 2) {
      icon = Icons.remove;
      iconColor = Color.fromARGB(255, 255, 255, 255);
      backgroundColor = Color.fromARGB(250, 182, 170, 255);
      border =
          Border.all(width: 2.5, color: Color.fromARGB(250, 157, 133, 244));
    } else {
      icon = Icons.remove;
      iconColor = Color.fromARGB(255, 0, 0, 0);
      backgroundColor = Color.fromARGB(250, 213, 201, 255);
      border = Border.all(width: 0, color: backgroundColor);
    }
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        border: border,
      ),
      margin: EdgeInsets.only(left: 3.0, right: 3.0),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: () {
            controller.jumpToPage(tilePosition);
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
