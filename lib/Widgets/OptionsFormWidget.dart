import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/**
 * Implementation:
 *OptionsWidget(options: [["Yes", "yes"], ["No", "no"]], setDefaultValue: false, onSaved: (data){print(data);}),
 */

class OptionsWidget extends FormField<dynamic> {
  OptionsWidget(
      {FormFieldSetter<dynamic>? onSaved,
      FormFieldValidator<dynamic>? validator,
      required List<dynamic> options,
      bool setDefaultValue = false,
      AutovalidateMode autoValidateMode = AutovalidateMode.disabled})
      : super(
            onSaved: onSaved,
            validator: validator ??
                (data) {
                  if (data == null) return "Please choose an option";
                  return null;
                },
            initialValue: setDefaultValue ? options[0][1] : null,
            autovalidateMode: autoValidateMode,
            builder: (FormFieldState<dynamic> state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                      children: options
                          .map((e) => new OptionButton(
                              text: e[0],
                              optionKey: e[1],
                              state: state,
                              isError: state.hasError,
                              isSelected: state.value == e[1]))
                          .toList()),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: state.hasError
                        ? Text(
                            state.errorText ?? "error",
                            style: TextStyle(color: Colors.red, fontSize: 10),
                          )
                        : Container(),
                  )
                ],
              );
            });
}

class OptionButton extends StatelessWidget {
  const OptionButton(
      {Key? key,
      required this.text,
      required this.optionKey,
      required this.state,
      required this.isSelected,
      this.isError = false})
      : super(key: key);

  final text;
  final optionKey;
  final state;
  final isSelected;
  final isError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(isSelected
                  ? Colors.blue
                  : isError
                      ? Color.fromARGB(255, 255, 185, 185)
                      : Colors.grey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      side: isError
                          ? BorderSide(color: Colors.red)
                          : BorderSide.none))),
          onPressed: () {
            state.didChange(optionKey);
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(text),
          )),
    );
  }
}

