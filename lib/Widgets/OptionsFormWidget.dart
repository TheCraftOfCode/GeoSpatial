import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;


/**
 * Implementation:
 *OptionsWidget(options: [["Yes", "yes"], ["No", "no"]], setDefaultValue: false, onSaved: (data){print(data);}),
 */

class OptionsWidget extends FormField<dynamic> {
  OptionsWidget(
      {FormFieldSetter<dynamic>? onSaved,
      FormFieldValidator<dynamic>? validator,
      required List<dynamic> options,
        required String title,
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
                  Text(title,style: GoogleFonts.poppins(fontSize: 15.0,color: colors.darkPrimaryTextColor),),
                  Wrap(
                      alignment: WrapAlignment.center,
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
                            style: GoogleFonts.poppins(color: Colors.red, fontSize: 10),
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
      padding: EdgeInsets.only(left: 3, right: 3, top: 1, bottom: 1),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(isSelected
                  ? Colors.greenAccent
                  : isError
                      ? Color(0xffE25963)
                      : Color(0xffF1D8B8)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      side: isError
                          ? BorderSide(color: Colors.red)
                          : BorderSide.none))),
          onPressed: () {
            state.didChange(optionKey);
          },
          child: Text(text)),
    );
  }
}