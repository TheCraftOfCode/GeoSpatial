import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:geo_spatial/Model/FamilyMembersCommonDataModel.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/DarkTheme.dart';
import 'package:geo_spatial/Utils/StoreInstance.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/CheckBoxAddExtraDialog.dart';
import 'package:geo_spatial/Widgets/DatePickerWidget.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/OptionsFormWidget.dart';
import 'package:geo_spatial/Widgets/TagTextWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../objectbox.g.dart';

class FamilyMemberAdd extends StatefulWidget {
  const FamilyMemberAdd({Key? key, this.familyMemberIndividualDataModel})
      : super(key: key);
  final FamilyMemberIndividualDataModel? familyMemberIndividualDataModel;

  @override
  _FamilyMemberAddState createState() => _FamilyMemberAddState();
}

class _FamilyMemberAddState extends State<FamilyMemberAdd> {
  _onSubmit(bool isValid) {
    print(isValid.toString());
  }

  bool dailyWageWorker = false;
  int count = 0;

  var vulnerabilities = <String, bool>{
    'Widower': false,
    'Divorcee': false,
    'Differently Abled': false,
    'Pregnant Woman': false,
    'Lactating Mother': false,
    'Elderly (>60 years)': false,
    'Widower': false,
    'Differently Abled': false,
    'Children below 2 years': false,
    'Others': false,
    'None': false
  };

  var occupations = <String, bool>{
    'Clerical support worker': false,
    'Services and sales worker': false,
    'Agricultural, forestry, fishery worker': false,
    'Professional': false,
    'Technician and associate professionals': false,
    'Craft and related trades workers': false,
    'Plant/Machine Operators and Assemblers': false,
    'Elementary occupations': false,
    'Armed Forces occupations': false,
    'Unemployed': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.darkScaffoldColor,
      appBar: AppBarBackButton('Add Family Member'),
      body: SizedBox(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).viewInsets.bottom * 1.45,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: FormPageView(
            [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextFormField(
                      initialValue:
                          widget.familyMemberIndividualDataModel?.userName,
                      onSaved: (String? data) async {
                        widget.familyMemberIndividualDataModel!.userName = data;
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
                    //TODO: Add initial value
                    context: context,
                    title: "Date of Birth",
                    hint: "Choose a date",
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (data) {
                      // widget.familyMemberIndividualDataModel!.dateOfBirth =
                      //     "${data!.day}/${data.month}/${data.year}";
                      // print(data);
                    },
                  ),
                  GenderPickerWithImage(
                    verticalAlignedText: false,
                    selectedGender: Gender.Male,
                    maleImage: AssetImage("assets/avatar_man.png"),
                    linearGradient: LinearGradient(
                        colors: [Color(0xfff54b64), Color(0xfff78361)]),
                    femaleImage: AssetImage("assets/avatar_woman.png"),
                    selectedGenderTextStyle: TextStyle(
                        color: Colors.greenAccent, fontWeight: FontWeight.bold),
                    unSelectedGenderTextStyle: TextStyle(
                        color: colors.darkPrimaryTextColor,
                        fontWeight: FontWeight.normal),
                    onChanged: (Gender? gender) {
                      print(gender);
                      widget.familyMemberIndividualDataModel!.gender =
                          gender.toString();
                    },
                    equallyAligned: true,
                    animationDuration: Duration(milliseconds: 300),
                    isCircular: true,
                    opacityOfGradient: 0.2,
                    padding: const EdgeInsets.all(3),
                    size: 70, //default : 40
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextFormField(
                      initialValue:
                          widget.familyMemberIndividualDataModel?.phoneNumber,
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
                          return "Please enter a value / 0 if no phone";
                        } else if (value!.length != 10) {
                          return "Enter a valid number";
                        } else
                          return null;
                      },
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!.phoneNumber =
                            data;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                  DropDownFormField(
                    defaultValue: widget.familyMemberIndividualDataModel!
                        .educationQualification,
                    list: [
                      'None',
                      'Elementary',
                      'Secondary',
                      'Higher Secondary',
                      'Bachelor\'s',
                      'Master\'s'
                    ],
                    onSaved: (data) {
                      widget.familyMemberIndividualDataModel!
                          .educationQualification = data;
                    },
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
                      initialValue:
                          widget.familyMemberIndividualDataModel?.aadhaarNumber,
                      keyboardType: TextInputType.number,
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
                          return "Enter 12 digit Aadhaar / 0 if absent";
                        } else if (value!.length != 12) {
                          return "Enter a valid Aadhaar";
                        } else
                          return null;
                      },
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!.aadhaarNumber =
                            data;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                  CheckBoxAddExtraAlertDialog(
                    title: 'Vulnerabilities',
                    hint: 'Please choose a vulnerability',
                    dataMap: vulnerabilities,
                    singleOption: false,
                    context: context,
                    onSaved: (map) {
                      print(map);
                    },
                    errorField: "Please choose a vulnerability / None",
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  CheckBoxAddExtraAlertDialog(
                    title: 'Occupation',
                    hint: 'Select applicable',
                    dataMap: occupations,
                    singleOption: false,
                    context: context,
                    onSaved: (map) {
                      print(map);
                    },
                    errorField: "Please choose an occupation / None",
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  OptionsWidget(
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    options: [
                      ["Yes", true],
                      ["No", false]
                    ],
                    title: "Daily wage worker?",
                    onSaved: (val) {
                      //dailyWageWorker = value.toLowerCase() as bool;
                      print(val.toString());
                      widget.familyMemberIndividualDataModel!.dailyWageWorker =
                          val;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextFormField(
                      initialValue:
                          widget.familyMemberIndividualDataModel?.incomePerDay,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          return "Enter Income/Day / 0";
                        }
                      },
                      onSaved: (val) {
                        //dailyWageWorker = value.toLowerCase() as bool;
                        print(val.toString());
                        widget.familyMemberIndividualDataModel!.incomePerDay =
                            val;
                      },
                    ),
                  )
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //TODO: Add work timings
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        initialValue: widget
                            .familyMemberIndividualDataModel?.incomePerMonth,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            return "Enter Income/Month / 0";
                          }
                        },
                        onSaved: (val) {
                          //dailyWageWorker = value.toLowerCase() as bool;
                          print(val.toString());
                          widget.familyMemberIndividualDataModel!
                              .incomePerMonth = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: OptionsWidget(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        options: [
                          ["Eligible", "eligible"],
                          ["Eligible, receiving", "eligible_receiving"],
                          ["Not eligible", "not_eligible"]
                        ],
                        title: 'Old age pension',
                        onSaved: (val) {
                          //dailyWageWorker = value.toLowerCase() as bool;
                          print(val.toString());
                          widget.familyMemberIndividualDataModel!.pension = val;
                        },
                      ),
                    ),
                    OptionsWidget(
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      options: [
                        ["Yes", "yes"],
                        ["No", "no"],
                      ],
                      title: 'Doing/Did business',
                      onSaved: (val) {
                        //dailyWageWorker = value.toLowerCase() as bool;
                        print(val.toString());
                        widget.familyMemberIndividualDataModel!.businessStatus =
                            val;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: OptionsWidget(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        options: [
                          ["Married", "married"],
                          ["Unmarried", "unmarried"],
                        ],
                        title: 'Marital Status',
                        onSaved: (val) {
                          //dailyWageWorker = value.toLowerCase() as bool;
                          print(val.toString());
                          widget.familyMemberIndividualDataModel!
                              .maritalStatus = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 20),
                      child: TagTextWidget(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        label: "Special Skills",
                        hint: "Enter skills here",
                        onSaved: (data) {
                          widget.familyMemberIndividualDataModel!
                              .specialSkills = data;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a value / NA";
                          } else
                            return null;
                        },
                      ),
                    ),
                  ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
                    child: TagTextWidget(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        label: "Frequent ailments",
                        hint: "Enter ailments here",
                        onSaved: (data) {
                          widget.familyMemberIndividualDataModel!
                              .frequentAilments = data;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a value / NA";
                          } else
                            return null;
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
                    child: TagTextWidget(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        label: "Communicable Diseases",
                        hint: "Enter diseases here",
                        onSaved: (data) {
                          widget.familyMemberIndividualDataModel!
                              .commutableDisease = data;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a value / NA";
                          } else
                            return null;
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
                    child: TagTextWidget(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        label: "Non-communicable diseases",
                        hint: "Enter diseases here",
                        onSaved: (data) {
                          widget.familyMemberIndividualDataModel!
                              .nonCommutableDisease = data;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a value / NA";
                          } else
                            return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: OptionsWidget(
                      options: [
                        ["Yes", "yes"],
                        ["No", "no"],
                      ],
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!.surgeries =
                            data;
                      },
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
                    onSaved: (data) {
                      widget.familyMemberIndividualDataModel!
                          .anganwadiServicesAware = data;
                    },
                    title: 'Aware about Anganwadi services?',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: OptionsWidget(
                      options: [
                        ["Yes", "yes"],
                        ["No", "no"],
                      ],
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!
                            .anganwadiServicesUsing = data;
                      },
                      title: 'Using any Anganwadi services?',
                    ),
                  ),
                  TagTextWidget(
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      label: "Anganwadi services utilised",
                      hint: "Enter services here",
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!
                            .anganwadiServicesUsedList = data;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a value / NA";
                        } else
                          return null;
                      }),
                  TagTextWidget(
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      label: "PHC services utilised",
                      hint: "Enter services here",
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!
                            .PHCServicesUsedList = data;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a value / NA";
                        } else
                          return null;
                      }),
                  TagTextWidget(
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      label: "Private Clinic services utilised",
                      hint: "Enter services here",
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!
                            .privateClinicServicesUsedList = data;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a value / NA";
                        } else
                          return null;
                      }),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextFormField(
                      initialValue: widget.familyMemberIndividualDataModel
                          ?.privateServiceReason,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      validator: (value) {
                        if (value == "") {
                          return "Enter a value / NA";
                        }
                      },
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!
                            .privateServiceReason = data;
                      },
                    ),
                  ),
                  OptionsWidget(
                    options: [
                      ['Yes', 'yes'],
                      ['No', 'no']
                    ],
                    title: "Do you use any tobacco based products?",
                    onSaved: (data) {
                      widget.familyMemberIndividualDataModel!.useOfTobacco =
                          data;
                    },
                  ),
                  OptionsWidget(
                    options: [
                      ['Yes', 'yes'],
                      ['No', 'no']
                    ],
                    title: "Do you consume alcohol?",
                    onSaved: (data) {
                      widget.familyMemberIndividualDataModel!.useOfAlcohol =
                          data;
                    },
                  ),
                  OptionsWidget(
                    options: [
                      ['Yes', 'yes'],
                      ['No', 'no']
                    ],
                    title: "Do you have Aarogya Setu installed?",
                    onSaved: (data) {
                      widget.familyMemberIndividualDataModel!
                          .aarogyaSetuInstalled = data;
                    },
                  ),
                  OptionsWidget(
                    options: [
                      ['Yes', 'yes'],
                      ['No', 'no']
                    ],
                    title: "Do you have the Vizhithiru app installed?",
                    onSaved: (data) {
                      widget.familyMemberIndividualDataModel!
                          .vizhithiruInstalled = data;
                    },
                  ),
                ],
              )
            ],
            _onSubmit,
            saveData: () async {
              var store = await StoreInstance.getInstance();
              Box box = store.box<FamilyMemberIndividualDataModel>();
              await box.put(widget.familyMemberIndividualDataModel);
            },
          ),
        ),
      ),
    );
  }
}
