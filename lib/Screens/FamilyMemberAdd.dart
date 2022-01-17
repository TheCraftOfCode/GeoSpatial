import 'package:flutter/material.dart';
import 'package:geo_spatial/Model/FamilyMembersCommonDataModel.dart';
import 'package:geo_spatial/Screens/NestedOptionsWidget.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/DarkTheme.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/CheckBoxAddExtraDialog.dart';
import 'package:geo_spatial/Widgets/DatePickerWidget.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/GenderWidget.dart';
import 'package:geo_spatial/Widgets/NestedOptionWidgetFormField.dart';
import 'package:geo_spatial/Widgets/OptionsFormWidget.dart';
import 'package:geo_spatial/Widgets/StartingEndingTimeWidget.dart';
import 'package:geo_spatial/Widgets/TagTextWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class FamilyMemberAdd extends StatefulWidget {
  const FamilyMemberAdd(
      {Key? key,
      this.familyMemberIndividualDataModel,
      this.dataModel,
      this.index})
      : super(key: key);
  final FamilyMemberIndividualDataModel? familyMemberIndividualDataModel;
  final FamilyMembersCommonDataModel? dataModel;
  final int? index;

  @override
  _FamilyMemberAddState createState() => _FamilyMemberAddState();
}

class _FamilyMemberAddState extends State<FamilyMemberAdd> {
  bool dailyWageWorker = false;

  _onSubmit(bool isValid) {
    print(isValid.toString());
    setState(() {
      isPageValid = isValid;
    });

    if (isValid) {
      print("Valid!");
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Please fill all fields!",
          style: GoogleFonts.poppins(color: colors.errorColor),
        ),
      ));
    }
  }

  bool isPageValid = false;
  int count = 0;

  var vulnerabilities = <String, bool>{
    'Widower': false,
    'Divorcee': false,
    'Differently Able': false,
    'Pregnant Woman': false,
    'Lactating Mother': false,
    'Elderly (>60 years)': false,
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

  var privateClinicReasons = <String,bool>{
    'Better treatment and personalised care' : false,
    'Easy to access' : false,
    'Less waiting time' : false
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!isPageValid) {
          return true;
        }
        final result = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: colors.darkScaffoldColor,
            title: Text(
              "Are you sure?",
              style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
            ),
            content: Text(
              "All unsaved changes will be lost.",
              style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'No',
                  style:
                      GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: colors.darkAccentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                child: Text('Yes',
                    style: TextStyle(color: colors.darkPrimaryTextColor)),
                onPressed: () async {
                  Navigator.pop(context, true);
                },
              ),
            ],
          ),
        );
        return result;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: colors.darkScaffoldColor,
        appBar: AppBarBackButton('Add Family Member'),
        body: SingleChildScrollView(
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
                    defaultDate:
                        widget.familyMemberIndividualDataModel?.dateOfBirth,
                    context: context,
                    title: "Date of Birth",
                    hint: "Choose a date",
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (data) {
                      widget.familyMemberIndividualDataModel!.dateOfBirth =
                          data;
                      print(data);
                    },
                  ),
                  GenderPickerWidget(
                    initialGender:
                        widget.familyMemberIndividualDataModel?.gender,
                    onChanged: (val) {
                      widget.familyMemberIndividualDataModel?.gender = val;
                      print("GENDER: $val");
                    },
                    onSaved: (val) {
                      print("GENDER SAVED: $val");
                    },
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
                    dataMap: widget
                            .familyMemberIndividualDataModel!.vulnerabilities ??
                        vulnerabilities,
                    singleOption: false,
                    context: context,
                    onSaved: (map) {
                      widget.familyMemberIndividualDataModel!.vulnerabilities =
                          map;
                    },
                    errorField: "Please choose a vulnerability / None",
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  CheckBoxAddExtraAlertDialog(
                    title: 'Occupation',
                    hint: 'Select applicable',
                    dataMap:
                        widget.familyMemberIndividualDataModel!.occupation ??
                            occupations,
                    singleOption: false,
                    context: context,
                    onSaved: (map) {
                      print(map);
                      widget.familyMemberIndividualDataModel!.occupation = map;
                    },
                    errorField: "Please choose an occupation / None",
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  OptionsWidget(
                    defaultValue:
                        widget.familyMemberIndividualDataModel!.dailyWageWorker,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    options: [
                      ["Yes", "yes"],
                      ["No", "no"]
                    ],
                    title: "Daily wage worker?",
                    onSaved: (val) {
                      print("Value recorded: $val");
                      widget.familyMemberIndividualDataModel!.dailyWageWorker =
                          val;
                    },
                  ),
                  NestedOptionWidgetFormField(nestedOptionData: [
                    new NestedOptionData(
                        subOptionDataMap: {"yes": true, "no": true}, boxName: 'One'),
                    new NestedOptionData(
                        subOptionDataMap: {"yes": true, "no": true}, boxName: 'Two'),
                    new NestedOptionData(subOptionDataMap: {"yes": true, "no": true},
                        boxName: 'Three'),
                    new NestedOptionData(
                        subOptionDataMap: {"yes": false, "no": false},
                        boxName: 'Four')
                  ], title: 'Select some options', context: context,),

                  Padding(
                    padding: EdgeInsets.all(15),
                    child: StartingEndingTimeWidget(
                      initialValue:
                          widget.familyMemberIndividualDataModel!.workTimings !=
                                  null
                              ? [
                                  TimeOfDay(
                                      hour: int.parse(widget
                                          .familyMemberIndividualDataModel!
                                          .workTimings![0]
                                          .split(":")[0]),
                                      minute: int.parse(widget
                                          .familyMemberIndividualDataModel!
                                          .workTimings![0]
                                          .split(":")[1]
                                          .replaceAll(new RegExp(r"\D"), ""))),
                                  TimeOfDay(
                                      hour: int.parse(widget
                                          .familyMemberIndividualDataModel!
                                          .workTimings![1]
                                          .split(":")[0]),
                                      minute: int.parse(widget
                                          .familyMemberIndividualDataModel!
                                          .workTimings![1]
                                          .split(":")[1]
                                          .replaceAll(new RegExp(r"\D"), "")))
                                ]
                              : null,
                      onSaved: (List<TimeOfDay>? timeList) {
                        print(timeList);
                        var timeFinalString = [
                          "${timeList![0].hour}:${timeList[0].minute} ${timeList[0].period == DayPeriod.am ? "AM" : "PM"}",
                          "${timeList[1].hour}:${timeList[1].minute} ${timeList[1].period == DayPeriod.am ? "AM" : "PM"}"
                        ];
                        widget.familyMemberIndividualDataModel!.workTimings =
                            timeFinalString;
                      },
                    ),
                  ),
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                      child: TextFormField(
                        initialValue: widget.familyMemberIndividualDataModel!.noOfDaysWorking,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: darkTheme.DarkTheme.textTheme.bodyText2,
                        decoration: InputDecoration(
                          label: Text(
                            "Number of work days",
                            style: GoogleFonts.poppins(
                                color: colors.darkSecondaryTextColor),
                          ),
                          hintText: "Please enter number of work days",
                          hintStyle: GoogleFonts.poppins(
                              color: colors.darkSecondaryTextColor),
                          contentPadding: EdgeInsets.all(7.0),
                        ),
                        validator: (value) {
                          if (int.parse(value!)< 1) {
                            return "Enter number of work days";
                          }
                          else if(int.parse(value)>31){
                            return "Enter a valid number of work days";
                          }
                        },
                        onSaved: (val) {
                          print(val.toString());
                          widget.familyMemberIndividualDataModel!.noOfDaysWorking =
                              val;
                        },
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0,bottom: 20.0,top: 10.0),
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
                          print(val.toString());
                          widget.familyMemberIndividualDataModel!.incomePerDay =
                              val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0),
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
                          print(val.toString());
                          widget.familyMemberIndividualDataModel!
                              .incomePerMonth = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: OptionsWidget(
                        defaultValue:
                            widget.familyMemberIndividualDataModel!.pension,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        options: [
                          ["Eligible", "eligible"],
                          ["Eligible, receiving", "eligible_receiving"],
                          ["Not eligible", "not_eligible"]
                        ],
                        title: 'Old age pension',
                        onSaved: (val) {
                          print(val.toString());
                          widget.familyMemberIndividualDataModel!.pension = val;
                        },
                      ),
                    ),
                    OptionsWidget(
                      defaultValue: widget
                          .familyMemberIndividualDataModel!.businessStatus,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      options: [
                        ["Yes", "yes"],
                        ["No", "no"],
                      ],
                      title: 'Doing/Did business',
                      onSaved: (val) {
                        print(val.toString());
                        widget.familyMemberIndividualDataModel!.businessStatus =
                            val;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: OptionsWidget(
                        defaultValue: widget
                            .familyMemberIndividualDataModel!.maritalStatus,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        options: [
                          ["Married", "married"],
                          ["Unmarried", "unmarried"],
                        ],
                        title: 'Marital Status',
                        onSaved: (val) {
                          print(val.toString());
                          widget.familyMemberIndividualDataModel!
                              .maritalStatus = val;
                        },
                      ),
                    ),
                  ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 20),
                    child: TagTextWidget(
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      label: "Special Skills",
                      hint: "Enter skills here",
                      initialValue: widget
                          .familyMemberIndividualDataModel!.specialSkills,
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
                    child: TagTextWidget(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        label: "Frequent ailments",
                        hint: "Enter ailments here",
                        initialValue: widget
                            .familyMemberIndividualDataModel!.frequentAilments,
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
                        initialValue: widget
                            .familyMemberIndividualDataModel!.commutableDisease,
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
                        initialValue: widget.familyMemberIndividualDataModel!
                            .nonCommutableDisease,
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
                      defaultValue:
                          widget.familyMemberIndividualDataModel!.surgeries,
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
                    defaultValue: widget.familyMemberIndividualDataModel!
                        .anganwadiServicesAware,
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
                      defaultValue: widget.familyMemberIndividualDataModel!
                          .anganwadiServicesUsing,
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
                      initialValue: widget.familyMemberIndividualDataModel!
                          .anganwadiServicesUsedList,
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: OptionsWidget(
                      defaultValue: widget.familyMemberIndividualDataModel!
                          .PHCServicesUsed,
                      options: [
                        ["Yes", "yes"],
                        ["No", "no"],
                      ],
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!
                            .PHCServicesUsed = data;
                      },
                      title: 'Using any PHC services?',
                    ),),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: OptionsWidget(
                      defaultValue: widget.familyMemberIndividualDataModel!
                          .privateClinicServicesUsed,
                      options: [
                        ["Yes", "yes"],
                        ["No", "no"],
                      ],
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!
                            .privateClinicServicesUsed = data;
                      },
                      title: 'Do you visit a private hospital?',
                    ),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CheckBoxAddExtraAlertDialog(
                    title: 'Reasons for using a private clinic',
                    hint: 'Please choose a reason',
                    dataMap: widget
                        .familyMemberIndividualDataModel!.privateServiceReason ??
                        privateClinicReasons,
                    singleOption: false,
                    context: context,
                    onSaved: (map) {
                      widget.familyMemberIndividualDataModel!.vulnerabilities =
                          map;
                    },
                    errorField: "Please choose a vulnerability / None",
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  OptionsWidget(
                    defaultValue:
                        widget.familyMemberIndividualDataModel!.useOfTobacco,
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
                    defaultValue:
                        widget.familyMemberIndividualDataModel!.useOfAlcohol,
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
                    defaultValue: widget
                        .familyMemberIndividualDataModel!.aarogyaSetuInstalled,
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
                    defaultValue: widget
                        .familyMemberIndividualDataModel!.vizhithiruInstalled,
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
            onChange: (isValid) {
              print(isValid);
              print(
                  "IS FAM VALID: ${widget.familyMemberIndividualDataModel?.dataValid}");
              widget.familyMemberIndividualDataModel?.dataValid = isValid;
            },
            submitMessage: "Submit to continue or go back to re-record data",
            note:
                "The entered fields are automatically saved when moving to next page and doesn't require submit to be clicked to save",
          ),
        ),
      ),
    );
  }
}

//TODO: Add tobacco products