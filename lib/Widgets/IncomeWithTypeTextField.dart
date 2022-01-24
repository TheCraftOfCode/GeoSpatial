import 'package:flutter/material.dart';
import 'package:geo_spatial/Utils/DarkTheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

class IncomeWithTypeTextField extends StatefulWidget {
  IncomeWithTypeTextField({
    Key? key,
    required this.onSaved,
    this.initialValue,
    required this.hintText,
    required this.text,
    this.validate,
    required this.listOfOptions,
    this.initialDropdownValue,
  }) : super(key: key);

  final void Function(String?, String?) onSaved;
  final initialValue;
  final String hintText;
  final String text;
  final String Function(String?)? validate;
  final List listOfOptions;
  final String? initialDropdownValue;

  @override
  State<IncomeWithTypeTextField> createState() =>
      _IncomeWithTypeTextFieldState();
}

class _IncomeWithTypeTextFieldState extends State<IncomeWithTypeTextField> {
  late String chosenOption;

  initState() {
    super.initState();
    chosenOption = widget.initialDropdownValue ??
        widget.listOfOptions[widget.listOfOptions.length - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Card(
              color: colors.darkScaffoldColor,
              elevation: 10,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<dynamic>(
                    value: chosenOption,
                    dropdownColor: colors.darkScaffoldColor,
                    isExpanded: true,
                    items: widget.listOfOptions.map<DropdownMenuItem>((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Container(
                          color: colors.darkScaffoldColor,
                          child: Text(
                            value,
                            overflow: TextOverflow.ellipsis,
                          ),
                          padding: EdgeInsets.only(left: 8),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        chosenOption = newValue;
                      });
                    },
                    style: GoogleFonts.poppins(
                        color: colors.darkPrimaryTextColor,
                        decorationColor: colors.errorColor),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              initialValue: widget.initialValue,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: darkTheme.DarkTheme.textTheme.bodyText2,
              decoration: InputDecoration(
                label: Text(
                  widget.text,
                  style:
                      GoogleFonts.poppins(color: colors.darkSecondaryTextColor),
                ),
                hintText: widget.hintText,
                hintStyle:
                    GoogleFonts.poppins(color: colors.darkSecondaryTextColor),
                contentPadding: EdgeInsets.all(7.0),
              ),
              validator: widget.validate ??
                  (value) {
                    if (value == "" || value == null) {
                      return "Enter Income";
                    }
                    else if (int.tryParse(value) != null) {
                      if (double.parse(value) <= 0)
                        return "Income can't be less than or equal to 0";
                    } else {
                      return "Income has to be a numeric value";
                    }
                  },
              onSaved: (value) {
                widget.onSaved(value, chosenOption);
              },
            ),
          ),

        ],
      ),
    );
  }
}
