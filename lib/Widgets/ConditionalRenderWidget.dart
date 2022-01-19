import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/OptionsFormWidget.dart';

class ConditionalRenderWidget extends StatefulWidget {
  const ConditionalRenderWidget(
      {Key? key,
      this.defaultValue,
      this.onSaved,
      required this.title,
      required this.conditionalPositiveWidget,
      required this.options,
      required this.conditionalPositiveValue,
      required this.conditionalNegativeValue,
      required this.conditionalNegativeWidget})
      : super(key: key);

  final defaultValue;
  final String conditionalPositiveValue;
  final String conditionalNegativeValue;
  final String title;
  final List<dynamic> options;
  final Function(dynamic)? onSaved;
  final Widget conditionalPositiveWidget;
  final Widget conditionalNegativeWidget;

  @override
  _ConditionalRenderWidgetState createState() =>
      _ConditionalRenderWidgetState();
}

class _ConditionalRenderWidgetState extends State<ConditionalRenderWidget> {
  bool isPositiveVisible = false;
  bool isNegativeVisible = false;

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() {
    if (widget.defaultValue != null) {
      isPositiveVisible =
          (widget.defaultValue == widget.conditionalPositiveValue);
      isNegativeVisible =
          (widget.defaultValue == widget.conditionalNegativeValue);
    }
  }

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
              isPositiveVisible = (val == widget.conditionalPositiveValue);
              isNegativeVisible = (val == widget.conditionalNegativeValue);
            });
          },
          title: widget.title,
          onSaved: widget.onSaved,
        ),
        Visibility(
          child: widget.conditionalPositiveWidget,
          visible: isPositiveVisible,
        ),
        Visibility(
          child: widget.conditionalNegativeWidget,
          visible: isNegativeVisible,
        )
      ],
    );
  }
}
