import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/StepCounterWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'PageViewContentBox.dart';

class FormPageView extends StatefulWidget {
  const FormPageView(this.pageWidgetList, this.onSubmit,
      {Key? key, this.saveData, this.submitMessage, this.note, this.onChange})
      : super(key: key);

  final List<Widget> pageWidgetList;
  final Function(bool) onSubmit;
  final Function(bool)? onChange;
  final saveData;
  final submitMessage;
  final note;

  @override
  _FormPageViewState createState() => _FormPageViewState();
}

class _FormPageViewState extends State<FormPageView> {
  //Page position
  int count = 0;
  late int widgetLength;
  late final List<GlobalObjectKey<FormState>> formKeyList;
  late final List<bool> formErrorTile;
  final PreloadPageController controller =
      PreloadPageController(initialPage: 0);
  late final List<Widget> widgetList;

  @override
  void initState() {
    super.initState();

    widgetLength = widget.pageWidgetList.length + 1;
    formErrorTile = List.generate(widgetLength - 1, (index) => false);

    formKeyList = List.generate(
        widgetLength - 1, (index) => GlobalObjectKey<FormState>(index));
    widgetList = List.generate(
        widgetLength - 1,
        (index) => PageViewContentBox(FormKeepAlive(
              widget.pageWidgetList[index],
              formKeyList[index],
            )));
    widgetList.add(PageViewContentBox(Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.submitMessage ?? "",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 25),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  child: Text("Submit", style: TextStyle(fontSize: 14)),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          colors.darkScaffoldColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: colors.darkScaffoldColor)))),
                  onPressed: () {
                    bool isValid = true;
                    for (int i = 0; i < widgetLength - 1; i++) {
                      var isDataValid = formKeyList[i].currentState!.validate();
                      isValid &= isDataValid;
                      formKeyList[i].currentState!.save();

                      if (isDataValid) {}
                    }
                    widget.onSubmit(isValid);
                  }),
            ),
          ),
          widget.saveData != null
              ? Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        child: Text("Save Data",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Colors.white)))),
                        onPressed: () {
                          widget.saveData();
                        }),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Text(
              widget.note ?? "",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Colors.white38,
                  fontWeight: FontWeight.w400,
                  fontSize: 13),
            ),
          )
        ],
      ),
    )));
  }

  _onPageViewChange(int page) {
    var isAllValid = true;
    for (int i = 0; i < page; i++) {
      setState(() {
        var isValid = formKeyList[i].currentState!.validate();
        isAllValid &= isValid;
        formKeyList[i].currentState!.save();
        if (isValid) {}
        formErrorTile[i] = !isValid;
      });
    }
    if (widget.onChange != null) {
      widget.onChange!(isAllValid);
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
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            // child: PageView(
            //   onPageChanged: _onPageViewChange,
            //   scrollDirection: Axis.horizontal,
            //   controller: controller,
            //   children: widgetList,
            // ),
            child: PreloadPageView.builder(
                onPageChanged: _onPageViewChange,
                scrollDirection: Axis.horizontal,
                preloadPagesCount: widgetList.length - 1,
                itemCount: widgetList.length,
                controller: controller,
                itemBuilder: (BuildContext context, int position) {
                  return widgetList[position];
                }),
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
      onChanged: () {},
    );
  }

  @override
  bool get wantKeepAlive => true;
}
