import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
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

    widgetLength = widget.pageWidgetList.length + 1;
    print(widgetLength);
    formErrorTile = List.generate(widgetLength - 1, (index) => false);

    print(formErrorTile);

    formKeyList = List.generate(
        widgetLength - 1, (index) => GlobalObjectKey<FormState>(index));

    print(formKeyList);

    widgetList = List.generate(
        widgetLength - 1,
        (index) => PageViewContentBox(FormKeepAlive(
              widget.pageWidgetList[index],
              formKeyList[index],
            )));
    widgetList.add(PageViewContentBox(Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            child: Text("Submit", style: TextStyle(fontSize: 14)),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.red)))),
            onPressed: () {
              bool isValid = true;
              for (int i = 0; i < widgetLength - 1; i++) {
                var isDataValid = formKeyList[i].currentState!.validate();
                isValid &= isDataValid;

                if (isDataValid) {
                  formKeyList[i].currentState!.save();
                }
              }

              widget.onSubmit(isValid);
            }),
      ),
    )));
  }

  _onPageViewChange(int page) {
    for (int i = 0; i < page; i++) {
      setState(() {
        var isValid = formKeyList[i].currentState!.validate();
        if (isValid) {
          formKeyList[i].currentState!.save();
        }
        formErrorTile[i] = !isValid;
      });
    }
    setState(() {
      count = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.darkScaffoldColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StepCounterWidget(widgetLength, count, formErrorTile, controller),
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.82,
              child: PageView(
                onPageChanged: _onPageViewChange,
                scrollDirection: Axis.horizontal,
                controller: controller,
                children: widgetList,
              ),
            ),
          ),
        ],
      ),
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
          if (widget._formKey.currentState!.validate())
            widget._formKey.currentState!.save();
        });
  }

  @override
  bool get wantKeepAlive => true;
}
