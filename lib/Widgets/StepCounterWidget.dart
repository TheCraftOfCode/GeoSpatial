import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepCounterWidget extends StatelessWidget {
  const StepCounterWidget(this.totalSteps, this.currentStep, {Key? key})
      : super(key: key);

  final int totalSteps;
  final int currentStep;

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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: StepProgressIndicator(
          totalSteps: totalSteps,
          currentStep: currentStep,
          size: 36,
          selectedColor: Color.fromARGB(250, 157, 133, 244),
          unselectedColor: Color.fromARGB(250, 213, 201, 255),
          customStep: (index, color, _) =>
              color == Color.fromARGB(250, 157, 133, 244)
                  ? Container(
                      color: color,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    )
                  : Container(
                      color: color,
                      child: Icon(
                        Icons.remove,
                      ),
                    ),
        ));
  }
}
