import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:geo_spatial/Model/FamilyMembersCommomDataModel.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/DarkTheme.dart';
import 'package:geo_spatial/Utils/tag_model.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DatePickerWidget.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/OptionsFormWidget.dart';
import 'package:geo_spatial/Widgets/TagTextWidget.dart';
import 'package:geo_spatial/Widgets/TextTagsWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class FamilyMemberAdd extends StatefulWidget {
  const FamilyMemberAdd({Key? key, this.modelData, this.indexOfFamilyMember}) : super(key: key);
  final modelData;
  final indexOfFamilyMember;

  @override
  _FamilyMemberAddState createState() => _FamilyMemberAddState();
}

class _FamilyMemberAddState extends State<FamilyMemberAdd> {
  _onSubmit(bool isValid) {
    print(isValid.toString());
  }

  bool dailyWageWorker = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.darkScaffoldColor,
      appBar: AppBarBackButton('Add Family Member'),
      body: SizedBox(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).viewInsets.bottom * 1.3,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: FormPageView([
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TagTextWidget(label: "Enter something", hint: "Enter something please", onSaved: (data){
                  for(var i in data!){
                    print(i);
                  }

                } ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    onSaved: (String? data){
                      /*
                      print("SAVE");
                      List<FamilyMemberIndividualDataModel> list = widget.modelData.familyMembersData;
                      FamilyMemberIndividualDataModel familyClass = list.elementAt(widget.indexOfFamilyMember);
                      familyClass.userName = data;

                       */
                      //print("NAME: ${widget.modelData.familyMembersData[widget.indexOfFamilyMember].userName}");
                    },
                    style: darkTheme.DarkTheme.textTheme.bodyText2,
                    decoration: InputDecoration(
                      //isDense: true,
                      label: Text(
                        "Name",
                        style: GoogleFonts.poppins(
                            color: colors.darkSecondaryTextColor),
                      ),
                      hintText: "Please enter name",
                      hintStyle: GoogleFonts.poppins(
                          color: colors.darkSecondaryTextColor),
                      contentPadding: EdgeInsets.all(7.0),
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "Please enter a name";
                      } else
                        return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                DatePickerWidget(
                  context: context,
                  title: "Date of Birth",
                  hint: "Choose a date",
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (data) {
                    print(data);
                  },
                ),
                GenderPickerWithImage(
                  verticalAlignedText: false,
                  selectedGender: Gender.Male,
                  selectedGenderTextStyle: TextStyle(
                      color: Colors.greenAccent, fontWeight: FontWeight.bold),
                  unSelectedGenderTextStyle: TextStyle(
                      color: colors.darkPrimaryTextColor,
                      fontWeight: FontWeight.normal),
                  onChanged: (Gender? gender) {
                    print(gender);
                  },
                  equallyAligned: true,
                  animationDuration: Duration(milliseconds: 300),
                  isCircular: true,
                  // default : true,
                  opacityOfGradient: 0.3,
                  padding: const EdgeInsets.all(3),
                  size: 70, //default : 40
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    style: darkTheme.DarkTheme.textTheme.bodyText2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        "Phone Number",
                        style: GoogleFonts.poppins(
                            color: colors.darkSecondaryTextColor),
                      ),
                      hintText: "Please enter 10 digit phone",
                      hintStyle: GoogleFonts.poppins(
                          color: colors.darkSecondaryTextColor),
                      contentPadding: EdgeInsets.all(7.0),
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "Please enter a value";
                      } else if (value!.length != 10) {
                        return "Enter a valid number";
                      } else
                        return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                DropDownFormField(
                  list: [
                    'None',
                    'Elementary',
                    'Secondary',
                    'Higher Secondary',
                    'Bachelor\'s',
                    'Master\'s'
                  ],
                  hint: "Select the highest",
                  title: "Educational qualification",
                  errorField: "Please choose a qualification",
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    style: darkTheme.DarkTheme.textTheme.bodyText2,
                    decoration: InputDecoration(
                      label: Text(
                        "Aadhaar Number",
                        style: GoogleFonts.poppins(
                            color: colors.darkSecondaryTextColor),
                      ),
                      hintText: "Please enter 12 digit Aadhaar",
                      hintStyle: GoogleFonts.poppins(
                          color: colors.darkSecondaryTextColor),
                      contentPadding: EdgeInsets.all(7.0),
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "Enter 12 digit Aadhaar";
                      } else if (value!.length != 12) {
                        return "Enter a valid Aadhaar";
                      } else
                        return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                DropDownFormField(
                  //TODO: Replace with a CheckBoxListTile
                  list: [
                    'Widower',
                    'Divorcee',
                    'Differently Abled',
                    'Pregnant Woman',
                    'Lactating Mother',
                    'Elderly (>60 years)',
                    'Widower',
                    'Differently Abled',
                    'Children below 2 years',
                    'Others',
                    'None'
                  ],
                  hint: "Select applicable",
                  title: "Vulnerabilities",
                  errorField: "Please choose a vulnerability",
                ),
                DropDownFormField(
                  //TODO: Replace with a CheckBoxListTile
                  list: [
                    'Clerical support worker',
                    'Services and sales worker',
                    'Agricultural, forestry, fishery worker',
                    'Unemployed',
                    'Professional',
                    'Technician and associate professionals',
                    'Craft and related trades workers',
                    'Plant/Machine Operators and Assemblers',
                    'Elementary occupations',
                    'Armed Forces occupations'
                  ],
                  hint: "Select applicable",
                  title: "Occupation",
                  errorField: "Please choose an occupation",
                ),
                OptionsWidget(
                  options: [
                    ["Yes", true],
                    ["No", false]
                  ],
                  title: "Daily wage worker?",
                  onSaved: (val) {
                    //dailyWageWorker = value.toLowerCase() as bool;
                    print(val.toString());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    style: darkTheme.DarkTheme.textTheme.bodyText2,
                    decoration: InputDecoration(
                      label: Text(
                        "Income/Day",
                        style: GoogleFonts.poppins(
                            color: colors.darkSecondaryTextColor),
                      ),
                      hintText: "Please enter income per day",
                      hintStyle: GoogleFonts.poppins(
                          color: colors.darkSecondaryTextColor),
                      contentPadding: EdgeInsets.all(7.0),
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "Enter Income/Day";
                      }
                    },
                  ),
                )
              ],
            ),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              //TODO: Add work timings
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextFormField(
                  style: darkTheme.DarkTheme.textTheme.bodyText2,
                  decoration: InputDecoration(
                    label: Text(
                      "Income/Month",
                      style: GoogleFonts.poppins(
                          color: colors.darkSecondaryTextColor),
                    ),
                    hintText: "Please enter income per month",
                    hintStyle: GoogleFonts.poppins(
                        color: colors.darkSecondaryTextColor),
                    contentPadding: EdgeInsets.all(7.0),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Enter Income/Month";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: OptionsWidget(
                  options: [
                    ["Eligible", "eligible"],
                    ["Eligible, receiving", "eligible_receiving"],
                    ["Not eligible", "not_eligible"]
                  ],
                  title: 'Old age pension',
                ),
              ),
              OptionsWidget(
                options: [
                  ["Yes", "yes"],
                  ["No", "no"],
                ],
                title: 'Doing/Did business',
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: OptionsWidget(
                  options: [
                    ["Married", "married"],
                    ["Unmarried", "unmarried"],
                  ],
                  title: 'Marital Status',
                ),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
                  child: TextFieldTags(
                    //initialTags: ["better", "lovely"],
                    textSeparators: [" ", ".", ","],
                    scrollableTagsPadding: EdgeInsets.all(10),
                    tagsStyler: TagsStyler(
                      showHashtag: false,
                      tagMargin: const EdgeInsets.only(right: 4.0),
                      tagCancelIcon:
                          Icon(Icons.cancel, size: 15.0, color: Colors.black),
                      tagCancelIconPadding:
                          EdgeInsets.only(left: 4.0, top: 2.0),
                      tagPadding: EdgeInsets.only(
                          top: 2.0, bottom: 4.0, left: 8.0, right: 4.0),
                      tagDecoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      tagTextStyle: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                    textFieldStyler: TextFieldStyler(
                      hintText: "Special Skills",
                      isDense: true,
                      textStyle: GoogleFonts.poppins(color: Colors.white),
                      textFieldBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),

                    onDelete: (tag) {
                      //remove value from list
                    },
                    onTag: (tag) {
                      //create a list and store value to list
                    },

                    onList: (List<String> list) {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
                  child: TextFieldTags(
                    //initialTags: ["better", "lovely"],
                    textSeparators: [" ", ".", ","],
                    scrollableTagsPadding: EdgeInsets.all(10),
                    tagsStyler: TagsStyler(
                      showHashtag: false,
                      tagMargin: const EdgeInsets.only(right: 4.0),
                      tagCancelIcon:
                          Icon(Icons.cancel, size: 15.0, color: Colors.black),
                      tagCancelIconPadding:
                          EdgeInsets.only(left: 4.0, top: 2.0),
                      tagPadding: EdgeInsets.only(
                          top: 2.0, bottom: 4.0, left: 8.0, right: 4.0),
                      tagDecoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      tagTextStyle: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                    textFieldStyler: TextFieldStyler(
                      hintText: "Frequent Ailments",
                      isDense: true,
                      textStyle: GoogleFonts.poppins(color: Colors.white),
                      textFieldBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                    onDelete: (tag) {
                      //remove value from list
                    },
                    onTag: (tag) {
                      //create a list and store value to list
                    },
                    onList: (List<String> list) {},
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
                  child: TextFieldTags(
                    //initialTags: ["better", "lovely"],
                    textSeparators: [" ", ".", ","],
                    scrollableTagsPadding: EdgeInsets.all(10),
                    tagsStyler: TagsStyler(
                      showHashtag: false,
                      tagMargin: const EdgeInsets.only(right: 4.0),
                      tagCancelIcon:
                          Icon(Icons.cancel, size: 15.0, color: Colors.black),
                      tagCancelIconPadding:
                          EdgeInsets.only(left: 4.0, top: 2.0),
                      tagPadding: EdgeInsets.only(
                          top: 2.0, bottom: 4.0, left: 8.0, right: 4.0),
                      tagDecoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      tagTextStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: colors.darkAccentColor),
                    ),
                    textFieldStyler: TextFieldStyler(
                      hintText: "Communicable diseases",
                      isDense: true,
                      textStyle: GoogleFonts.poppins(
                          color: colors.darkSecondaryTextColor),
                    ),
                    onDelete: (tag) {
                      //remove value from list
                    },
                    onTag: (tag) {
                      //create a list and store value to list
                    },

                    onList: (List<String> list) {},
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
                  child: TextFieldTags(
                    //initialTags: ["better", "lovely"],
                    textSeparators: [" ", ".", ","],
                    scrollableTagsPadding: EdgeInsets.all(10),
                    tagsStyler: TagsStyler(
                      showHashtag: false,
                      tagMargin: const EdgeInsets.only(right: 4.0),
                      tagCancelIcon:
                          Icon(Icons.cancel, size: 15.0, color: Colors.black),
                      tagCancelIconPadding:
                          EdgeInsets.only(left: 4.0, top: 2.0),
                      tagPadding: EdgeInsets.only(
                          top: 2.0, bottom: 4.0, left: 8.0, right: 4.0),
                      tagDecoration: BoxDecoration(
                        color: colors.darkScaffoldColor,
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      tagTextStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: colors.darkAccentColor),
                    ),
                    textFieldStyler: TextFieldStyler(
                      hintText: "Non communicable diseases",
                      isDense: true,
                      textStyle: GoogleFonts.poppins(
                          color: colors.darkSecondAccentColor),
                      textFieldBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                    onDelete: (tag) {
                      //remove value from list
                    },
                    onTag: (tag) {},
                      //create a list and store value to list
                    onList: (List<String> list) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: OptionsWidget(
                    options: [
                      ["Yes", "yes"],
                      ["No", "no"],
                    ],
                    title: 'Surgeries',
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OptionsWidget(
                  options: [
                    ["Yes", "yes"],
                    ["No", "no"],
                  ],
                  title: 'Aware about Anganwadi services?',
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: OptionsWidget(
                    options: [
                      ["Yes", "yes"],
                      ["No", "no"],
                    ],
                    title: 'Using any Anganwadi services?',
                  ),
                ),
                TextFieldTags(
                  //initialTags: ["better", "lovely"],
                  textSeparators: [" ", ".", ","],
                  scrollableTagsPadding: EdgeInsets.all(10),
                  tagsStyler: TagsStyler(
                    showHashtag: false,
                    tagMargin: const EdgeInsets.only(right: 4.0),
                    tagCancelIcon:
                        Icon(Icons.cancel, size: 15.0, color: Colors.black),
                    tagCancelIconPadding: EdgeInsets.only(left: 4.0, top: 2.0),
                    tagPadding: EdgeInsets.only(
                        top: 2.0, bottom: 4.0, left: 8.0, right: 4.0),
                    tagDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    tagTextStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: colors.darkAccentColor),
                  ),
                  textFieldStyler: TextFieldStyler(
                    hintText: "Anganwadi Services used",
                    isDense: true,
                    textStyle: GoogleFonts.poppins(
                        color: colors.darkSecondaryTextColor),
                    textFieldBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),
                  onDelete: (tag) {
                    //remove value from list
                  },
                  onTag: (tag) {
                    //create a list and store value to list
                  },

                  onList: (List<String> list) {},
                ),
                TextFieldTags(
                  //initialTags: ["better", "lovely"],
                  textSeparators: [" ", ".", ","],
                  scrollableTagsPadding: EdgeInsets.all(10),
                  tagsStyler: TagsStyler(
                    showHashtag: false,
                    tagMargin: const EdgeInsets.only(right: 4.0),
                    tagCancelIcon:
                        Icon(Icons.cancel, size: 15.0, color: Colors.black),
                    tagCancelIconPadding: EdgeInsets.only(left: 4.0, top: 2.0),
                    tagPadding: EdgeInsets.only(
                        top: 2.0, bottom: 4.0, left: 8.0, right: 4.0),
                    tagDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    tagTextStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: colors.darkAccentColor),
                  ),
                  textFieldStyler: TextFieldStyler(
                    hintText: "PHC Services used",
                    isDense: true,
                    textStyle: GoogleFonts.poppins(
                        color: colors.darkSecondaryTextColor),
                    textFieldBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),
                  onDelete: (tag) {
                    //remove value from list
                  },
                  onTag: (tag) {
                    //create a list and store value to list
                  },
                  onList: (List<String> list) {},
                ),
                TextFieldTags(
                  //initialTags: ["better", "lovely"],
                  textSeparators: [" ", ".", ","],
                  scrollableTagsPadding: EdgeInsets.all(10),
                  tagsStyler: TagsStyler(
                    showHashtag: false,
                    tagMargin: const EdgeInsets.only(right: 4.0),
                    tagCancelIcon:
                        Icon(Icons.cancel, size: 15.0, color: Colors.black),
                    tagCancelIconPadding: EdgeInsets.only(left: 4.0, top: 2.0),
                    tagPadding: EdgeInsets.only(
                        top: 2.0, bottom: 4.0, left: 8.0, right: 4.0),
                    tagDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    tagTextStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: colors.darkAccentColor),
                  ),
                  textFieldStyler: TextFieldStyler(
                    hintText: "Private Clinic services used",
                    isDense: true,
                    textStyle: GoogleFonts.poppins(
                        color: colors.darkSecondaryTextColor),
                    textFieldBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),
                  onDelete: (tag) {
                    //remove value from list
                  },
                  onTag: (tag) {
                    //create a list and store value to list
                  },

                  onList: (List<String> list) {
                    print("TAGS: ");
                    for(var i in list){
                      print(i);
                    }
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    style: darkTheme.DarkTheme.textTheme.bodyText2,
                    decoration: InputDecoration(
                      label: Text(
                        "Why private?",
                        style: GoogleFonts.poppins(
                            color: colors.darkSecondaryTextColor),
                      ),
                      hintText: "Please enter reason",
                      hintStyle: GoogleFonts.poppins(
                          color: colors.darkSecondaryTextColor),
                      contentPadding: EdgeInsets.all(7.0),
                    ),
                  ),
                ),
                OptionsWidget(options: [
                  ['Yes', 'yes'],
                  ['No', 'no']
                ], title: "Do you use any tobacco based products?"),
                OptionsWidget(options: [
                  ['Yes', 'yes'],
                  ['No', 'no']
                ], title: "Do you consume alcohol?"),
                OptionsWidget(options: [
                  ['Yes', 'yes'],
                  ['No', 'no']
                ], title: "Do you have Aarogya Setu installed?"),
                OptionsWidget(options: [
                  ['Yes', 'yes'],
                  ['No', 'no']
                ], title: "Do you have the Vizhithiru app installed?"),
              ],
            )
          ], _onSubmit),
        ),
      ),
    );
  }
}
