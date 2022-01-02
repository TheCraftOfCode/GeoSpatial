import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

/**
 * Implementation:
 *
 *  Map<String, bool> values = {
    'yes': false,
    'no': false,
    };

 * CheckBoxAddExtraAlertDialog(
    title: 'Choose resource',
    hint: 'Choose your resource',
    dataMap: values,
    singleOption: true,
    context: context,
    onSaved: (map) {
    print(map);
    print('called');
    },
    ),
 */

class CheckBoxAddExtraAlertDialog extends FormField<Map> {
  CheckBoxAddExtraAlertDialog(
      {FormFieldSetter<Map>? onSaved,
      FormFieldValidator<Map>? validator,
      required title,
      required hint,
      required Map dataMap,
      errorField,
      singleOption = false,
      showAddNewBox = true,
      required context,
      AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction})
      : super(
            onSaved: onSaved,
            validator: validator ??
                (data) {
                  if (data == null || data.isEmpty)
                    return errorField ?? "Please select a value";
                  else {
                    bool isValid = false;
                    data.forEach((k, v) => {isValid |= v});

                    if (!isValid) return "Please select a value";
                  }
                  return null;
                },
            initialValue: dataMap,
            autovalidateMode: autoValidateMode,
            builder: (FormFieldState<Map> state) {
              getDisplayOptions() {
                if (state.hasError) {
                  return Text(
                    hint,
                    style: GoogleFonts.poppins(color: Colors.red),
                    textAlign: TextAlign.end,
                  );
                } else {
                  var displayValue = '';
                  state.value!.forEach((k, v) {
                    if (v) displayValue += k + ', ';
                  });

                  if (displayValue != '') {
                    if (displayValue.length >= 2) {
                      displayValue =
                          displayValue.substring(0, displayValue.length - 2);
                    }
                    return Text(
                      displayValue,
                      style: GoogleFonts.poppins(
                          color: colors.darkPrimaryTextColor),
                      textAlign: TextAlign.end,
                    );
                  } else {
                    return Text(
                      hint,
                      style: GoogleFonts.poppins(color: Colors.grey),
                      textAlign: TextAlign.end,
                    );
                  }
                }
              }

              return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(title,
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: colors.darkPrimaryTextColor)),
                    ),
                    Card(
                      color: colors.darkScaffoldColor,
                      elevation: 5,
                      margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: InkWell(
                        onTap: () {
                          _showMyDialog(context, title, state, singleOption,
                              showAddNewBox);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 12, bottom: 12),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: getDisplayOptions(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.arrow_right,
                                  color: colors.darkPrimaryTextColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    state.hasError
                        ? Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              state.errorText ?? "error",
                              style: TextStyle(
                                  color: Colors.red, fontSize: 10),
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            });
}

Future<void> _showMyDialog(
    context, dialogTitle, state, singleOption, showAddNewBox) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialogWidget(
        dialogTitle: dialogTitle,
        state: state,
        showAddNew: showAddNewBox,
        singleOption: singleOption,
      );
    },
  );
}

class AlertDialogWidget extends StatefulWidget {
  final dialogTitle;
  final state;
  final singleOption;
  final showAddNew;

  const AlertDialogWidget(
      {Key? key,
      required this.dialogTitle,
      required this.state,
      required this.singleOption,
      this.showAddNew})
      : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  TextEditingController _controller = TextEditingController();

  _addNewData(String value) {
    Map dataList = widget.state.value;
    value = value.trim();
    if (value.isNotEmpty) {
      if (!dataList.containsKey(value)) {
        dataList[value] = false;
      }
      widget.state.didChange(dataList);
      _controller.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> dialogList = [
      widget.showAddNew
          ? TextFormField(
              style: TextStyle(color: Colors.white60),
              onFieldSubmitted: (submit) {
                _addNewData(submit);
              },
              controller: _controller,
              decoration: InputDecoration(
                  // fillColor: Colors.blue,
                  hintText: "Add a new field",
                  label: Text("Add New Field"),
                  suffixIcon: Material(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(4.0),
                        topRight: Radius.circular(4.0)),
                    child: IconButton(
                        splashRadius: 17,
                        onPressed: () {
                          var text = _controller.text;
                          _addNewData(text);
                        },
                        icon: Icon(
                          Icons.add,
                          color: colors.darkAccentColor,
                        )),
                  )),
            )
          : Container()
    ];
    var dataList = widget.state.value;

    dataList!.forEach((k, v) => {
          dialogList.add(CheckboxListTile(
            checkColor: colors.darkPrimaryTextColor,
            activeColor: colors.darkAccentColor,
            title: Text(k,
                style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor)),
            value: widget.state.value[k],
            onChanged: (value) {
              Map newPair = widget.state.value;

              if (widget.singleOption) {
                widget.state.value!.forEach((k, v) {
                  newPair.update(
                    k,
                    (existingValue) => false,
                    ifAbsent: () => false,
                  );
                });
              }

              newPair[k] = value;
              setState(() {
                dataList = newPair;
              });
              widget.state.didChange(newPair);
            },
          ))
        });

    return AlertDialog(
      backgroundColor: colors.darkSecondBackgroundColor,
      title: Text(
        widget.dialogTitle,
        style: GoogleFonts.poppins(color: colors.darkAccentColor),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: dialogList,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Choose',
            style: GoogleFonts.poppins(color: colors.darkAccentColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
