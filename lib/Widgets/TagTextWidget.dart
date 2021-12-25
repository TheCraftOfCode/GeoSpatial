import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

class TagTextWidget extends FormField<List<String>> {
  TagTextWidget(
      {FormFieldSetter<List<String>>? onSaved,
      FormFieldValidator<List<String>>? validator,
      list,
      required label,
      required hint,
      emptyListMessage,
      errorField,
      AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction})
      : super(
            onSaved: onSaved,
            validator: validator ??
                (data) {
                  if (data == null || data.isEmpty)
                    return errorField ?? "Please enter a value";
                  return null;
                },
            initialValue: [],
            autovalidateMode: autoValidateMode,
            builder: (FormFieldState<List<String>> state) {
              final TextEditingController _contentEditingController =
                  TextEditingController();

              ScrollController _scrollController = new ScrollController();

              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: _contentEditingController,
                        onSubmitted: (string) {
                          if (!string.isEmpty) {
                            _contentEditingController.clear();
                            List<String>? list = state.value;
                            list?.add(string);
                            state.didChange(list);
                          }
                        },
                        style: GoogleFonts.poppins(color: Colors.white),
                        decoration: InputDecoration(
                          errorText: state.hasError ? state.errorText : null,
                          label: Text(
                            label,
                            style: GoogleFonts.poppins(
                                color: colors.darkSecondaryTextColor),
                          ),
                          hintText: hint,
                          hintStyle: GoogleFonts.poppins(
                              color: colors.darkSecondaryTextColor),
                          contentPadding: EdgeInsets.all(7.0),
                        ),
                      ),
                    ),
                    Container(
                      height: 35.0,
                      width: double.infinity,
                      child: state.value!.isEmpty
                          ? Center(
                              child: Text(emptyListMessage ?? "List is empty"),
                            )
                          : ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.value?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TagBox(
                                    text: state.value![index],
                                    delete: () {
                                      List<String>? list = state.value;
                                      list?.removeAt(index);
                                      state.didChange(list);
                                    });
                              },
                            ),
                    )
                  ],
                ),
              );
            });
}

class TagBox extends StatelessWidget {
  const TagBox({Key? key, this.text, Function? this.delete}) : super(key: key);

  final text;
  final delete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 7, right: 2, top: 2, bottom: 2),
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                delete();
              },
              child: Icon(
                Icons.cancel,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
