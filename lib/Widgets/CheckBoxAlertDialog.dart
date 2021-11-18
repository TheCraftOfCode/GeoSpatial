import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/**
 * Implementation:
 *
 *  Map<String, bool> values = {
    'yes': false,
    'no': false,
    };

 * CheckBoxAlertDialog(
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

class CheckBoxAlertDialog extends FormField<Map> {
  CheckBoxAlertDialog(
      {FormFieldSetter<Map>? onSaved,
      FormFieldValidator<Map>? validator,
      required title,
      required hint,
      required Map dataMap,
      errorField,
      singleOption = false,
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
                    style: TextStyle(color: Colors.red),
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
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.end,
                    );
                  } else {
                    return Text(
                      hint,
                      style: TextStyle(color: Colors.grey),
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
                              fontSize: 25, color: Colors.black)),
                    ),
                    Card(
                      elevation: 2,
                      margin: EdgeInsets.only(bottom: 4),
                      child: InkWell(
                        onTap: () {
                          _showMyDialog(context, title, state, singleOption);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 15, bottom: 15),
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
                                child: Icon(Icons.arrow_right),
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
                              style: TextStyle(color: Colors.red, fontSize: 10),
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            });
}

Future<void> _showMyDialog(context, dialogTitle, state, singleOption) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialogWidget(
        dialogTitle: dialogTitle,
        state: state,
        singleOption: singleOption,
      );
    },
  );
}

class AlertDialogWidget extends StatefulWidget {
  final dialogTitle;
  final state;
  final singleOption;

  const AlertDialogWidget(
      {Key? key,
      required this.dialogTitle,
      required this.state,
      required this.singleOption})
      : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> dialogList = [];
    var dataList = widget.state.value;

    dataList!.forEach((k, v) => {
          dialogList.add(CheckboxListTile(
            title: Text(k),
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
      title: Text(widget.dialogTitle),
      content: SingleChildScrollView(
        child: Column(
          children: dialogList,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
