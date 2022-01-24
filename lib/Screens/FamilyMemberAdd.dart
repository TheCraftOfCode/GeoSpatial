import 'package:flutter/material.dart';
import 'package:geo_spatial/Model/FamilyDataModels.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/DarkTheme.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/CheckBoxAddExtraDialog.dart';
import 'package:geo_spatial/Widgets/ConditionalRenderWidget.dart';
import 'package:geo_spatial/Widgets/DatePickerWidget.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/GenderWidget.dart';
import 'package:geo_spatial/Widgets/IncomeWithTypeTextField.dart';
import 'package:geo_spatial/Widgets/NestedOptionWidgetFormField.dart';
import 'package:geo_spatial/Widgets/NestedOptionsWidget.dart';
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
    'Widower (M)': false,
    'Widow (F)': false,
    'Divorcee': false,
    'Differently Abled': false,
    'Pregnant Woman': false,
    'Lactating Mother': false,
    'Elderly (>60 years)': false,
    'Children below 2 years': false,
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
    'Studying': false,
  };

  var privateClinicReasons = <String, bool>{
    'Better treatment and personalised care': false,
    'Easy to access': false,
    'Less waiting time': false
  };

  var frequentAilments = <String, bool>{
    'Cold and Flu': false,
    'Diarrhoea': false,
    'Headaches': false,
    'Fever': false
  };

  var communicableDiseases = <String, bool>{
    'COVID': false,
    'Typhoid': false,
    'Dengue': false,
    'Malaria': false,
    'HIV/AIDS': false
  };

  var nonCommunicableDiseases = <String, bool>{
    'Cardiovascular disease': false,
    'Diabetes': false,
    'Treatable cancers': false,
    'Hypertension': false
  };

  var tobaccoProducts = <String, bool>{
    'Normal tobacco': false,
    'Hans': false,
    'Betel nuts': false,
    'Beedi': false
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
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
                        /**
                         * If condition to check if user name is equal to the HeadofFamily
                         * HeadOfFamily value updated as well
                         */
                        if (widget.dataModel!.headOfFamily != null) {
                          if (widget.dataModel!.headOfFamily ==
                              widget
                                  .familyMemberIndividualDataModel!.userName) {
                            widget.dataModel!.headOfFamily = data;
                          }
                        }
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
                    validator: (val) {
                      if (val != null) if (val.isAfter(DateTime.now())) {
                        return 'Please choose a valid date';
                      }
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
                        helperText:
                            "Leave empty if person is not willing to share",
                        helperStyle: GoogleFonts.poppins(
                            color: colors.darkSecondaryTextColor),
                        hintText: "Please enter 10 digit phone",
                        hintStyle: GoogleFonts.poppins(
                            color: colors.darkSecondaryTextColor),
                        contentPadding: EdgeInsets.all(7.0),
                      ),
                      validator: (value) {
                        if (value == "" || value == null)
                          return null;
                        else if (int.tryParse(value) == null) {
                          return "Phone number can only have numbers";
                        } else if (value.length != 10) {
                          return "Enter a valid Phone Number";
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
                    validator: (val) {},
                    errorField: "Please choose a vulnerability / None",
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
                    onChanged: (val) {
                      if (val == "yes") {
                        print("SELECTED TRUE VAL");
                      }

                      setState(() {
                        dailyWageWorker = val == "yes";
                      });
                    },
                    title: "Daily wage worker?",
                    onSaved: (val) {
                      print("Value recorded: $val");
                      widget.familyMemberIndividualDataModel!.dailyWageWorker =
                          val;
                    },
                  ),
                  ConditionalRenderWidget(
                    title: "Employed?",
                    onSaved: (val) {
                      widget.familyMemberIndividualDataModel!.employed = val;
                    },
                    defaultValue:
                        widget.familyMemberIndividualDataModel!.employed,
                    conditionalNegativeWidget: ConditionalRenderWidget(
                      title: 'Student?',
                      onSaved: (val) {
                        widget.familyMemberIndividualDataModel!.student = val;
                      },
                      defaultValue:
                          widget.familyMemberIndividualDataModel!.student,
                      options: [
                        ["Yes", "yes"],
                        ["No", "no"],
                      ],
                      conditionalPositiveValue: "yes",
                      conditionalNegativeValue: "no",
                      conditionalPositiveWidget: DropDownFormField(
                        defaultValue: widget.familyMemberIndividualDataModel!
                            .studentEducationCategory,
                        list: [
                          'School',
                          'College',
                          'Vocational',
                        ],
                        onSaved: (data) {
                          widget.familyMemberIndividualDataModel!
                              .studentEducationCategory = data;
                        },
                        hint: "Choose education category",
                        title: "Education",
                        errorField: "Please choose a category",
                      ),
                      conditionalNegativeWidget: Container(),
                    ),
                    conditionalPositiveWidget: Column(
                      children: [
                        NestedOptionWidgetFormField(
                          onSaved: (val) {
                            widget.familyMemberIndividualDataModel!
                                .occupationData = val;
                          },
                          nestedOptionData: widget
                                  .familyMemberIndividualDataModel!
                                  .occupationData ??
                              [
                                new NestedOptionData(subOptionDataMap: {
                                  "Administrative and Commercial Managers":
                                      false,
                                  "Chief Executives, Senior Officials and Legislators":
                                      false,
                                  "Production and Specialized Services Managers":
                                      false,
                                  "Hospitality, Retail and Other Services Managers":
                                      false
                                }, boxName: 'Managers'),
                                new NestedOptionData(subOptionDataMap: {
                                  "Science and Engineering Professionals":
                                      false,
                                  "Health Professionals": false,
                                  "Teaching Professionals": false,
                                  "Business and Administration Professionals":
                                      false,
                                  "Information and Communications Technology Professionals":
                                      false,
                                  "Legal, Social and Cultural Professionals":
                                      false
                                }, boxName: 'Professionals'),
                                new NestedOptionData(
                                    subOptionDataMap: {
                                      "Science and Engineering Associate Professionals":
                                          false,
                                      "Health Associate Professionals": false,
                                      "Business and Administration Associate Professionals":
                                          false,
                                      "Legal, Social, Cultural and Related Associate Professionals":
                                          false,
                                      "Information and Communications Technicians":
                                          false
                                    },
                                    boxName:
                                        'Technicians and Associate Professionals'),
                                new NestedOptionData(subOptionDataMap: {
                                  "General and Keyboard Clerks": false,
                                  "Customer Services Clerks": false,
                                  "Numerical and Material Recording Clerks":
                                      false,
                                  "Other Clerical Support Workers": false
                                }, boxName: 'Clerical Support Workers'),
                                new NestedOptionData(subOptionDataMap: {
                                  "Personal Services Workers": false,
                                  "Sales Workers": false,
                                  "Personal Care Workers": false,
                                  "Protective Services Workers": false
                                }, boxName: 'Services and Sales Workers'),
                                new NestedOptionData(
                                    subOptionDataMap: {
                                      "Market-oriented Skilled Agricultural Workers":
                                          false,
                                      "Market-oriented Skilled Forestry, Fishery and Hunting Workers":
                                          false,
                                      "Subsistence Farmers, Fishers, Hunters and Gatherers":
                                          false
                                    },
                                    boxName:
                                        'Skilled Agricultural, Forestry and Fishery Workers'),
                                new NestedOptionData(subOptionDataMap: {
                                  "Building and Related Trades Workers (excluding Electricians)":
                                      false,
                                  "Metal, Machinery and Related Trades Workers":
                                      false,
                                  "Handicraft and Printing Workers": false,
                                  "Electrical and Electronic Trades Workers":
                                      false,
                                  "Food Processing, Woodworking, Garment and Other Craft and Related Trades Workers":
                                      false
                                }, boxName: 'Craft and Related Trades Workers'),
                                new NestedOptionData(
                                    subOptionDataMap: {
                                      "Stationary Plant and Machine Operators":
                                          false,
                                      "Assemblers": false,
                                      "Drivers and Mobile Plant Operators":
                                          false
                                    },
                                    boxName:
                                        'Plant and Machine Operators and Assemblers'),
                                new NestedOptionData(subOptionDataMap: {
                                  "Cleaners and Helpers": false,
                                  "Agricultural, Forestry and Fishery Labourers":
                                      false,
                                  "Labourers in Mining, Construction, Manufacturing and Transport":
                                      false,
                                  "Food Preparation Assistants": false,
                                  "Street and Related Sales and Services Workers":
                                      false,
                                  "Refuse Workers and Other Elementary Workers":
                                      false
                                }, boxName: 'Elementary Occupations'),
                                new NestedOptionData(subOptionDataMap: {
                                  "Commissioned Armed Forces Officers": false,
                                  "Non-commissioned Armed Forces Officers":
                                      false,
                                  "Armed Forces Occupations, Other Ranks": false
                                }, boxName: 'Armed Forces Occupations'),
                              ],
                          title: 'Occupation',
                          context: context,
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: StartingEndingTimeWidget(
                            initialValue: widget
                                        .familyMemberIndividualDataModel!
                                        .workTimings !=
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
                                            .replaceAll(
                                                new RegExp(r"\D"), ""))),
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
                              widget.familyMemberIndividualDataModel!
                                  .workTimings = timeFinalString;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          child: TextFormField(
                            initialValue: widget
                                .familyMemberIndividualDataModel!
                                .noOfDaysWorking,
                            keyboardType: TextInputType.number,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                              print(value);
                              print("value");
                              if (value == null || value == "")
                                return "Please enter number of work days";
                              else if (int.tryParse(value) == null) {
                                return "Field can only have numbers";
                              } else if (int.parse(value) < 1) {
                                return "Enter number of work days";
                              } else if (int.parse(value) > 31) {
                                return "Enter a valid number of work days";
                              }
                            },
                            onSaved: (val) {
                              print(val.toString());
                              widget.familyMemberIndividualDataModel!
                                  .noOfDaysWorking = val;
                            },
                          ),
                        ),
                        IncomeWithTypeTextField(
                          initialDropdownValue: widget
                              .familyMemberIndividualDataModel!.incomeType,
                          initialValue:
                              widget.familyMemberIndividualDataModel!.income,
                          onSaved: (income, option) {
                            widget.familyMemberIndividualDataModel!.income =
                                income;
                            widget.familyMemberIndividualDataModel!.incomeType =
                                option;
                            print(income! + " " + option!);
                          },
                          text: 'Income',
                          hintText: 'Enter income',
                          listOfOptions: ["Day", "Week", "Month"],
                        ),
                      ],
                    ),
                    options: [
                      ["Yes", "yes"],
                      ["No", "no"],
                    ],
                    conditionalPositiveValue: "yes",
                    conditionalNegativeValue: "no",
                  )
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 20.0, top: 20.0),
                      child: TextFormField(
                        initialValue: widget
                            .familyMemberIndividualDataModel?.aadhaarNumber,
                        keyboardType: TextInputType.number,
                        style: darkTheme.DarkTheme.textTheme.bodyText2,
                        decoration: InputDecoration(
                          label: Text(
                            "Aadhaar Number",
                            style: GoogleFonts.poppins(
                                color: colors.darkSecondaryTextColor),
                          ),
                          hintText: "Please enter 12 digit Aadhaar.",
                          helperText:
                              "Leave empty if person is not willing to share",
                          helperStyle: GoogleFonts.poppins(
                              color: colors.darkSecondaryTextColor),
                          hintStyle: GoogleFonts.poppins(
                              color: colors.darkSecondaryTextColor),
                          contentPadding: EdgeInsets.all(7.0),
                        ),
                        validator: (value) {
                          if (value == "" || value == null)
                            return null;
                          else if (int.tryParse(value) == null) {
                            return "Aadhaar number can only have numbers";
                          } else if (value.length != 12) {
                            return "Enter a valid Aadhaar";
                          } else
                            return null;
                        },
                        onSaved: (data) {
                          widget.familyMemberIndividualDataModel!
                              .aadhaarNumber = data;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: OptionsWidget(
                        defaultValue:
                            widget.familyMemberIndividualDataModel!.pension,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        options: [
                          ["Eligible, not receiving", "eligible"],
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    child: TagTextWidget(
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      label: "Special Skills",
                      hint: "Enter skills here",
                      initialValue:
                          widget.familyMemberIndividualDataModel!.specialSkills,
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!.specialSkills =
                            data;
                      },
                      validator: (value) {},
                    ),
                  ),
                  CheckBoxAddExtraAlertDialog(
                    title: 'Frequent ailments',
                    hint: 'Please choose the applicable',
                    dataMap: widget.familyMemberIndividualDataModel!
                            .frequentAilments ??
                        frequentAilments,
                    singleOption: false,
                    context: context,
                    onSaved: (map) {
                      widget.familyMemberIndividualDataModel!.frequentAilments =
                          map;
                    },
                    validator: (val) {},
                    errorField: "Please choose ailments/None",
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CheckBoxAddExtraAlertDialog(
                    title: 'Communicable diseases',
                    hint: 'Please choose the applicable',
                    dataMap: widget.familyMemberIndividualDataModel!
                            .communicableDiseases ??
                        communicableDiseases,
                    singleOption: false,
                    context: context,
                    onSaved: (map) {
                      widget.familyMemberIndividualDataModel!
                          .communicableDiseases = map;
                    },
                    validator: (val) {},
                    errorField: "Please choose diseases/None",
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CheckBoxAddExtraAlertDialog(
                    title: 'Non Communicable diseases',
                    hint: 'Please choose the applicable',
                    dataMap: widget.familyMemberIndividualDataModel!
                            .nonCommunicableDiseases ??
                        nonCommunicableDiseases,
                    singleOption: false,
                    context: context,
                    onSaved: (map) {
                      widget.familyMemberIndividualDataModel!
                          .nonCommunicableDiseases = map;
                    },
                    validator: (val) {},
                    errorField: "Please choose diseases/None",
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
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
                      title: 'Any Surgeries?',
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    child: ConditionalRenderWidget(
                      title: 'Using any Anganwadi services?',
                      defaultValue: widget.familyMemberIndividualDataModel!
                          .anganwadiServicesUsing,
                      options: [
                        ["Yes", "yes"],
                        ["No", "no"]
                      ],
                      onSaved: (val) {
                        print("Value recorded: $val");
                        widget.familyMemberIndividualDataModel!
                            .anganwadiServicesUsing = val;
                      },
                      conditionalPositiveValue: 'yes',
                      conditionalNegativeValue: 'no',
                      conditionalPositiveWidget: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: TagTextWidget(
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            label: "Anganwadi services utilised",
                            hint: "Enter services here",
                            initialValue: widget
                                .familyMemberIndividualDataModel!
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
                      ),
                      conditionalNegativeWidget: Container(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: OptionsWidget(
                      defaultValue: widget
                          .familyMemberIndividualDataModel!.PHCServicesUsed,
                      options: [
                        ["Yes", "yes"],
                        ["No", "no"],
                      ],
                      onSaved: (data) {
                        widget.familyMemberIndividualDataModel!
                            .PHCServicesUsed = data;
                      },
                      title: 'Using any PHC services?',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ConditionalRenderWidget(
                      title: 'Do you visit a private hospital?',
                      defaultValue: widget.familyMemberIndividualDataModel!
                          .privateClinicServicesUsed,
                      options: [
                        ["Yes", "yes"],
                        ["No", "no"]
                      ],
                      onSaved: (val) {
                        print("Value recorded: $val");
                        widget.familyMemberIndividualDataModel!
                            .privateClinicServicesUsed = val;
                      },
                      conditionalPositiveValue: 'yes',
                      conditionalNegativeValue: 'no',
                      conditionalPositiveWidget: CheckBoxAddExtraAlertDialog(
                        title: 'Reasons for using a private clinic',
                        hint: 'Please choose a reason',
                        dataMap: widget.familyMemberIndividualDataModel!
                                .privateServiceReason ??
                            privateClinicReasons,
                        singleOption: false,
                        context: context,
                        onSaved: (map) {
                          widget.familyMemberIndividualDataModel!
                              .privateServiceReason = map;
                        },
                        errorField: "Please choose a reason",
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      conditionalNegativeWidget: Container(),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ConditionalRenderWidget(
                      title: 'Do you use any tobacco based products?',
                      defaultValue:
                          widget.familyMemberIndividualDataModel!.useOfTobacco,
                      options: [
                        ["Yes", "yes"],
                        ["No", "no"]
                      ],
                      onSaved: (val) {
                        print("Value recorded: $val");
                        widget.familyMemberIndividualDataModel!.useOfTobacco =
                            val;
                      },
                      conditionalPositiveValue: 'yes',
                      conditionalNegativeValue: 'no',
                      conditionalPositiveWidget: CheckBoxAddExtraAlertDialog(
                        title: 'Tobacco products',
                        hint: 'Choose applicable products',
                        dataMap: widget.familyMemberIndividualDataModel!
                                .tobaccoProducts ??
                            tobaccoProducts,
                        context: context,
                        errorField: 'Please choose at least one',
                        onSaved: (map) {
                          widget.familyMemberIndividualDataModel!
                              .tobaccoProducts = map;
                        },
                      ),
                      conditionalNegativeWidget: Container(),
                    ),
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
                "The entered fields are automatically saved when changed and doesn't require submit to be clicked to save locally",
          ),
        ),
      ),
    );
  }
}
