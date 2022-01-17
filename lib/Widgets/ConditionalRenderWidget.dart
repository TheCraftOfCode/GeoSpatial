import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/OptionsFormWidget.dart';

class ConditionalRenderWidget extends StatefulWidget {
  const ConditionalRenderWidget(
      {Key? key,
      this.defaultValue,
      this.onSaved,
      required this.title,
      required this.conditionalWidget,
      required this.options,
      required this.conditionalValue})
      : super(key: key);

  final defaultValue;
  final String conditionalValue;
  final String title;
  final List<dynamic> options;
  final Function(dynamic)? onSaved;
  final Widget conditionalWidget;

  @override
  _ConditionalRenderWidgetState createState() =>
      _ConditionalRenderWidgetState();
}

class _ConditionalRenderWidgetState extends State<ConditionalRenderWidget> {
  //(widget.defaultValue == widget.conditionalValue)
  //TODO: Add a check condition to see if default value equals conditional value and update isVisible
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionsWidget(
          defaultValue: widget.defaultValue,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          options: widget.options,
          onChanged: (val) {
            setState(() {
              isVisible = (val == widget.conditionalValue);
            });
          },
          title: widget.title,
          onSaved: widget.onSaved,
        ),
        Visibility(
          child: widget.conditionalWidget,
          visible: isVisible,
        )
      ],
    );
  }
}
