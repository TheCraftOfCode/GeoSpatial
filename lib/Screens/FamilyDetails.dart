import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geo_spatial/Model/FamilyMembersCommonDataModel.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/CheckBoxAddExtraDialog.dart';
import 'package:geo_spatial/Widgets/ConditionalRenderWidget.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/OptionsFormWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class FamilyDetails extends StatefulWidget {
  const FamilyDetails({Key? key, this.modelData}) : super(key: key);
  final FamilyMembersCommonDataModel? modelData;

  @override
  State<FamilyDetails> createState() => _FamilyDetailsState();
}

class _FamilyDetailsState extends State<FamilyDetails> {
  _onSubmit(bool isValid) {
    print(isValid.toString());
    if (isValid) {
      print("Valid!");
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: AutoSizeText(
          "Please fill all fields!",
          style: TextStyle(color: colors.errorColor),
        ),
      ));
    }
  }

  final PageController controller = PageController(initialPage: 0);

  final List<GlobalObjectKey<FormState>> formKeyList =
      List.generate(3, (index) => GlobalObjectKey<FormState>(index));
  final error = [false, false, false];

  var two_three_mfg = <String, bool>{
    'TVS': false,
    'Hero': false,
    'Honda': false,
    'Piaggio (scooters)': false,
    'Suzuki': false,
    'Yamaha': false,
    'Royal Enfield': false,
    'Bajaj': false,
    'Mahindra & Mahindra': false,
    'Force': false,
    'Tempo': false,
    'None': false
  };

  var four_mfg = <String, bool>{
    'Maruti Suzuki': false,
    'Hyundai': false,
    'Tata': false,
    'Ashok Leyland': false,
    'Eicher': false,
    'Ford': false,
    'Toyota': false,
    'Tafe': false,
    'Volkswagen': false,
    'Force': false,
    'Tempo': false,
    'Renault': false,
    'Skoda': false,
    'Mitsubishi': false,
    'None': false
  };

  var noToiletsWhy = <String, bool>{
    'Lack of space': false,
    'Lack of money': false,
    'Habit of open defecation': false,
    'Using community toilets': false
  };

  var seeds_preserved = {
    'Country Seeds': false,
    'Indigenous Seeds': false,
    'Hybrid Seeds': false
  };

  var local_food = {
    'yes': false,
    'no': false,
  };

  var trees_owned = {
    'Moringa Tree': false,
    'Guava Tree': false,
    'Papaya Tree': false,
    'Pomegranate Tree': false,
    'Custard Apple Tree': false,
    'Banana': false,
    'Indian Gooseberry': false
  };

  var garden_plants = {
    'Tapioca': false,
    'Tomato': false,
    'Brinjal': false,
    'Ladies finger': false,
    'Chili': false,
    'Mint': false,
    'Spinach': false,
    'Ridge Guard': false,
    'Bitter Guard': false,
    'Cluster Beans': false,
    'Long Beans': false,
    'Snake Guard': false
  };

  var water_sources = {
    'None': false,
    'Lake': false,
    'Pond': false,
    'Groundwater': false,
    'Borewell': false,
    'Well': false,
    'Tap': false,
    'Water supply': false,
    'Lorry/Van': false
  };

  var incomeFromCattleEnabled = false;
  var toiletFacility = false;

  _getUserNameList() {
    var list = [];
    widget.modelData!.individualDataListTransient.forEach((element) {
      if (element.userName != null) if (element.userName != "")
        list.add(element.userName);
    });
    return list;
  }

  //TODO: Add village code
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
                  child: Text(
                    'Yes',
                    style:
                        GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
                  ),
                  onPressed: () {
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
            appBar: AppBarBackButton('Family Details'),
            body: SingleChildScrollView(
                child: FormPageView(
              [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: DropDownFormField(
                          //TODO: Fetch names from family member add saved objects and populate list
                          title: 'Head of family',
                          hint: 'Choose the head of family',
                          errorField: 'Please choose a head of family',
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {},
                          list: _getUserNameList(),
                        )),
                    OptionsWidget(
                        options: [
                          ['Yes', 'yes'],
                          ['No', 'no']
                        ],
                        defaultValue: widget.modelData!.drinkingWater,
                        onSaved: (val) {
                          print("Value recorded: $val");
                          widget.modelData!.drinkingWater = val;
                        },
                        title: "Do you have drinking water available?"),
                    CheckBoxAddExtraAlertDialog(
                      singleOption: false,
                      dataMap: widget.modelData!.sourceOfDrinkingWater ??
                          water_sources,
                      onSaved: (val) {
                        print("Value recorded: $val");
                        widget.modelData!.sourceOfDrinkingWater = val;
                      },
                      hint: "Select source",
                      title: "Source of Water",
                      errorField: "Please choose an option",
                      context: context,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ConditionalRenderWidget(
                        title: "Do you have toilet facilities?",
                        defaultValue: widget.modelData!.toiletFacility,
                        options: [
                          ["Yes", "yes"],
                          ["No", "no"]
                        ],
                        onSaved: (val) {
                          print("Value recorded: $val");
                          widget.modelData!.toiletFacility = val;
                        },
                        conditionalPositiveValue: 'yes',
                        conditionalNegativeValue: 'no',
                        conditionalPositiveWidget: Container(),
                        conditionalNegativeWidget: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              child: CheckBoxAddExtraAlertDialog(
                                title: 'Why do you not have a toilet?',
                                hint: 'Please choose reason',
                                singleOption: false,
                                context: context,
                                dataMap: widget.modelData!.noToiletsWhy ??
                                    noToiletsWhy,
                                onSaved: (val) {
                                  print("Value recorded: $val");
                                  widget.modelData?.noToiletsWhy = val;
                                },
                                errorField: "Please choose a reason",
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            OptionsWidget(
                                options: [
                                  ['Yes', 'yes'],
                                  ['No', 'no']
                                ],
                                defaultValue: widget.modelData!.communityToilet,
                                onSaved: (val) {
                                  print("Value recorded: $val");
                                  widget.modelData!.communityToilet = val;
                                },
                                title: "Community toilet?"),
                          ],
                        ),
                      ),
                    ),
                    OptionsWidget(
                        options: [
                          ['Clean', 'clean'],
                          ['Unclean', 'unclean']
                        ],
                        defaultValue:
                            widget.modelData!.environmentSanitationLevel,
                        onSaved: (val) {
                          print("Value recorded: $val");
                          widget.modelData!.environmentSanitationLevel = val;
                        },
                        title: "Environmental sanitation level: "),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropDownFormField(
                      list: ['1', '2', '3', '4', '5', 'More'],
                      hint: "Select the highest",
                      title: "No. of two wheelers",
                      defaultValue: widget.modelData!.noOfTwoWheelers,
                      onSaved: (val) {
                        print("Value recorded: $val");
                        widget.modelData!.noOfTwoWheelers = val;
                      },
                      errorField: "Please choose a valid number",
                    ),
                    DropDownFormField(
                      list: ['1', '2', '3', '4', '5', 'More'],
                      hint: "Select the highest",
                      title: "No. of three wheelers",
                      defaultValue: widget.modelData!.noOfThreeWheelers,
                      onSaved: (val) {
                        print("Value recorded: $val");
                        widget.modelData!.noOfThreeWheelers = val;
                      },
                      errorField: "Please choose a valid number",
                    ),
                    CheckBoxAddExtraAlertDialog(
                      title: 'Two/Three wheeler brand',
                      hint: 'Please choose brands',
                      singleOption: false,
                      context: context,
                      dataMap: widget.modelData!.twoThreeWheelManufacturer ??
                          two_three_mfg,
                      onSaved: (val) {
                        print("Value recorded: $val");
                        widget.modelData?.twoThreeWheelManufacturer = val;
                      },
                      errorField: "Please choose a brand",
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    DropDownFormField(
                      list: ['1', '2', '3', '4', '5', 'More'],
                      hint: "Select the highest",
                      title: "No. of four wheelers",
                      errorField: "Please choose a valid number",
                      defaultValue: widget.modelData!.noOfFourWheelers,
                      onSaved: (val) {
                        print("Value recorded: $val");
                        widget.modelData!.noOfFourWheelers = val;
                      },
                    ),
                    CheckBoxAddExtraAlertDialog(
                      title: 'Four wheeler brand',
                      hint: 'Please choose brand',
                      singleOption: false,
                      context: context,
                      dataMap:
                          widget.modelData!.twoFourManufacturer ?? four_mfg,
                      onSaved: (val) {
                        print("Value recorded: $val");
                        widget.modelData?.twoFourManufacturer = val;
                      },
                      errorField: "Please choose a brand",
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OptionsWidget(
                        options: [
                          ['Yes', 'yes'],
                          ['No', 'no']
                        ],
                        defaultValue: widget.modelData!.runningWaterAvailable,
                        onSaved: (val) {
                          print("Value recorded: $val");
                          widget.modelData!.runningWaterAvailable = val;
                        },
                        title: "Is running water available?"),
                    ConditionalRenderWidget(
                        title: "Do you own cattle?",
                        defaultValue: widget.modelData!.isCattleOwned,
                        options: [
                          ["Yes", "yes"],
                          ["No", "no"]
                        ],
                        onSaved: (val) {
                          print("Value recorded: $val");
                          widget.modelData!.isCattleOwned = val;
                        },
                        conditionalPositiveValue: 'yes',
                        conditionalNegativeValue: 'no',
                        conditionalPositiveWidget: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 20.0),
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                                color: colors.darkPrimaryTextColor),
                            initialValue: widget.modelData!.incomeFromCattle,
                            onSaved: (val) {
                              print("Value recorded: $val");
                              widget.modelData!.incomeFromCattle = val;
                            },
                            decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                    color: colors.darkSecondaryTextColor),
                                contentPadding: EdgeInsets.all(7.0),
                                hintText: "Enter income in Rupees",
                                label: AutoSizeText(
                                  'Income from cattle/month',
                                  style: GoogleFonts.poppins(
                                      color: colors.darkSecondaryTextColor),
                                )),
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        conditionalNegativeWidget: Container()),
                    ConditionalRenderWidget(
                        title: "Do you own farmland?",
                        defaultValue: widget.modelData!.isFarmLandOwned,
                        options: [
                          ["Yes", "yes"],
                          ["No", "no"]
                        ],
                        onSaved: (val) {
                          print("Value recorded: $val");
                          widget.modelData!.isFarmLandOwned = val;
                        },
                        conditionalPositiveValue: 'yes',
                        conditionalNegativeValue: 'no',
                        conditionalPositiveWidget: CheckBoxAddExtraAlertDialog(
                          title: 'Crops Cultivated',
                          hint: 'Choose cultivated crops',
                          singleOption: false,
                          context: context,
                          dataMap: widget.modelData!.cropsCultivated ??
                              seeds_preserved,
                          onSaved: (val) {
                            print("Value recorded: $val");
                            widget.modelData!.cropsCultivated = val;
                          },
                        ),
                        conditionalNegativeWidget: Container()),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConditionalRenderWidget(
                        title: "Do you preserve seeds?",
                        defaultValue: widget.modelData!.isSeedsPreserved,
                        options: [
                          ["Yes", "yes"],
                          ["No", "no"]
                        ],
                        onSaved: (val) {
                          print("Value recorded: $val");
                          widget.modelData!.isSeedsPreserved = val;
                        },
                        conditionalPositiveValue: 'yes',
                        conditionalNegativeValue: 'no',
                        conditionalPositiveWidget: CheckBoxAddExtraAlertDialog(
                          title: 'Seeds Preserved',
                          hint: 'Choose preserved seeds',
                          singleOption: false,
                          context: context,
                          dataMap: widget.modelData!.preservedSeedsMap ??
                              seeds_preserved,
                          onSaved: (val) {
                            print("Value recorded: $val");
                            widget.modelData!.preservedSeedsMap = val;
                          },
                        ),
                        conditionalNegativeWidget: Container()),
                    CheckBoxAddExtraAlertDialog(
                      title: 'Trees owned',
                      hint: 'Choose trees owned',
                      singleOption: false,
                      context: context,
                      dataMap: widget.modelData!.treesOwnedMap ?? trees_owned,
                      onSaved: (val) {
                        print("Value recorded: $val");
                        widget.modelData!.treesOwnedMap = val;
                      },
                    ),
                    CheckBoxAddExtraAlertDialog(
                      title: 'Local foods consumed',
                      hint: 'Choose your resource',
                      //TODO: Change variable to local food

                      dataMap: widget.modelData!.localFoodMap ?? local_food,
                      onSaved: (val) {
                        print("Value recorded: $val");
                        widget.modelData!.localFoodMap = val;
                      },
                      singleOption: false,
                      context: context,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ConditionalRenderWidget(
                            title: "Do you have a kitchen garden?",
                            defaultValue:
                                widget.modelData!.isKitchenGardenOwned,
                            options: [
                              ["Yes", "yes"],
                              ["No", "no"]
                            ],
                            onSaved: (val) {
                              print("Value recorded: $val");
                              widget.modelData!.isKitchenGardenOwned = val;
                            },
                            conditionalPositiveValue: 'yes',
                            conditionalNegativeValue: 'no',
                            conditionalPositiveWidget: Padding(
                              padding: EdgeInsets.only(bottom: 30),
                              child: CheckBoxAddExtraAlertDialog(
                                title: 'Kitchen Garden plants',
                                hint: 'Choose garden plants',
                                singleOption: false,
                                context: context,
                                dataMap:
                                    widget.modelData!.kitchenGardenPlants ??
                                        garden_plants,
                                onSaved: (val) {
                                  print("Value recorded: $val");
                                  widget.modelData!.kitchenGardenPlants = val;
                                },
                              ),
                            ),
                            conditionalNegativeWidget: Container()),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 15.0),
                            child: Text(
                              "Address",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15.0,
                                  color: colors.darkPrimaryTextColor),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 70.0),
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                                color: colors.darkPrimaryTextColor),
                            initialValue: widget.modelData!.addressOne,
                            onSaved: (val) {
                              print("Value recorded: $val");
                              widget.modelData!.addressOne = val;
                            },
                            decoration: InputDecoration(
                              label: Text(
                                "First Line",
                                style: GoogleFonts.poppins(
                                    color: colors.darkSecondaryTextColor),
                              ),
                              hintText: "Please enter first line",
                              hintStyle: GoogleFonts.poppins(
                                  color: colors.darkSecondaryTextColor),
                              contentPadding: EdgeInsets.all(7.0),
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Enter First Line";
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 70.0),
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                                color: colors.darkPrimaryTextColor),
                            initialValue: widget.modelData!.addressTwo,
                            onSaved: (val) {
                              print("Value recorded: $val");
                              widget.modelData!.addressTwo = val;
                            },
                            decoration: InputDecoration(
                              label: Text(
                                "Second Line",
                                style: GoogleFonts.poppins(
                                    color: colors.darkSecondaryTextColor),
                              ),
                              hintText: "Please enter second line",
                              hintStyle: GoogleFonts.poppins(
                                  color: colors.darkSecondaryTextColor),
                              contentPadding: EdgeInsets.all(7.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 70.0),
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                                color: colors.darkPrimaryTextColor),
                            initialValue: widget.modelData!.city,
                            onSaved: (val) {
                              print("Value recorded: $val");
                              widget.modelData!.city = val;
                            },
                            decoration: InputDecoration(
                              label: Text(
                                "City",
                                style: GoogleFonts.poppins(
                                    color: colors.darkSecondaryTextColor),
                              ),
                              hintText: "Please enter city",
                              hintStyle: GoogleFonts.poppins(
                                  color: colors.darkSecondaryTextColor),
                              contentPadding: EdgeInsets.all(7.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
              _onSubmit,
              onChange: (isValid) {
                print(isValid);
                print("IS FAM VALID: ${widget.modelData?.commonDetailsValid}");
                widget.modelData?.commonDetailsValid = isValid;
              },
              submitMessage: "Submit to Continue or go back to re-record data",
              note:
                  "The entered fields are automatically saved when moving to next page and doesn't require submit to be clicked to save",
            ))));
  }
}
