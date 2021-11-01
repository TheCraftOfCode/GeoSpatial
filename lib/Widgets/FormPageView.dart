import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Widgets/StepCounterWidget.dart';
import 'PageViewContentBox.dart';

class FormPageView extends StatefulWidget {
  const FormPageView(this.pageWidgetList, this.onSubmit, {Key? key})
      : super(key: key);

  final List<Widget> pageWidgetList;
  final Function(bool) onSubmit;

  @override
  _FormPageViewState createState() => _FormPageViewState();
}

class _FormPageViewState extends State<FormPageView> {
  //Page position
  int count = 0;
  late int widgetLength;
  late final List<GlobalObjectKey<FormState>> formKeyList;
  late final List<bool> formErrorTile;
  final PageController controller = PageController(initialPage: 0);
  late final List<Widget> widgetList;

  @override
  void initState() {
    super.initState();

    widgetLength = widget.pageWidgetList.length;
    print(widgetLength);
    formErrorTile = List.generate(widgetLength, (index) => false);

    print(formErrorTile);

    formKeyList = List.generate(
        widgetLength, (index) => GlobalObjectKey<FormState>(index));

    print(formKeyList);

    widgetList = List.generate(
        widgetLength,
        (index) => PageViewContentBox(FormKeepAlive(
              widget.pageWidgetList[index],
              formKeyList[index],
            )));
    widgetList.add(PageViewContentBox(ElevatedButton(
        child: Text("Submit", style: TextStyle(fontSize: 14)),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.red)))),
        onPressed: () {
          bool isValid = true;
          for (int i = 0; i < widgetLength; i++) {
            isValid &= formKeyList[i].currentState!.validate();
          }

          widget.onSubmit(isValid);
        })));
  }

  _onPageViewChange(int page) {
    for (int i = 0; i < page; i++) {
      setState(() {
        formErrorTile[i] = !formKeyList[i].currentState!.validate();
      });
    }
    setState(() {
      count = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StepCounterWidget(widgetLength, count, formErrorTile),
        Expanded(
            child: Container(
          child: PageView(
            onPageChanged: _onPageViewChange,
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: widgetList,
          ),
        )),
      ],
    );
  }
}

class FormKeepAlive extends StatefulWidget {
  const FormKeepAlive(this.childWidget, this._formKey, {Key? key})
      : super(key: key);

  final Widget childWidget;
  final GlobalObjectKey<FormState> _formKey;

  @override
  State<FormKeepAlive> createState() => _FormKeepAliveState();
}

class _FormKeepAliveState extends State<FormKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
        child: widget.childWidget,
        key: widget._formKey,
        onChanged: () {
          widget._formKey.currentState!.validate();
        });
  }

  @override
  bool get wantKeepAlive => true;
}
