import 'package:flutter/material.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/CheckBoxAlertDialog.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/OptionsFormWidget.dart';
import 'package:geo_spatial/Widgets/TagTextWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class FamilyDetails extends StatefulWidget {
  const FamilyDetails({Key? key}) : super(key: key);

  @override
  State<FamilyDetails> createState() => _FamilyDetailsState();
}

class _FamilyDetailsState extends State<FamilyDetails> {
  _onSubmit(bool isValid) {
    print(isValid.toString());
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
    'Skodaa': false,
    'Mitsubishi': false,
    'None': false
  };

  var seeds_preserved = {
    'yes': false,
    'no': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colors.darkScaffoldColor,
        appBar: AppBarBackButton('Family Details'),
        body: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).viewInsets.bottom * 1.1,
            child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: FormPageView([
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OptionsWidget(options: [
                        ['Yes', 'yes'],
                        ['No', 'no']
                      ], title: "Do you have drinking water available?"),
                      DropDownFormField(
                        list: [
                          'None',
                          'Lake',
                          'Pond',
                          'Groundwater',
                          'Well',
                          'Tap',
                          'Water supply',
                          'Lorry/Van'
                        ],
                        hint: "Select source",
                        title: "Source of Water",
                        errorField: "Please choose an option",
                      ),
                      OptionsWidget(options: [
                        ['Yes', 'yes'],
                        ['No', 'no']
                      ], title: "Do you have toilet facilities?"),
                      OptionsWidget(options: [
                        ['Yes', 'yes'],
                        ['No', 'no']
                      ], title: "Is running water available?"),
                      OptionsWidget(options: [
                        ['Yes', 'yes'],
                        ['No', 'no']
                      ], title: "If not toilet, community toilet?"),
                      OptionsWidget(options: [
                        ['Clean', 'clean'],
                        ['Unclean', 'unclean']
                      ], title: "Environmental sanitation level: "),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropDownFormField(
                        list: ['1', '2', '3', '4', '5', 'More'],
                        hint: "Select the highest",
                        title: "No of two wheelers",
                        errorField: "Please choose a valid number",
                      ),
                      DropDownFormField(
                        list: ['1', '2', '3', '4', '5', 'More'],
                        hint: "Select the highest",
                        title: "No of three wheelers",
                        errorField: "Please choose a valid number",
                      ),
                      CheckBoxAlertDialog(
                        title: 'Two/Three wheeler manufacturer',
                        hint: 'Please choose manufacturers',
                        dataMap: two_three_mfg,
                        singleOption: false,
                        context: context,
                        onSaved: (map) {
                          print(map);
                        },
                        errorField: "Please choose a manufacturer",
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      DropDownFormField(
                        list: ['1', '2', '3', '4', '5', 'More'],
                        hint: "Select the highest",
                        title: "No of four wheelers",
                        errorField: "Please choose a valid number",
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CheckBoxAlertDialog(
                        title: 'Four wheeler manufacturer',
                        hint: 'Please choose manufacturers',
                        dataMap: four_mfg,
                        singleOption: false,
                        context: context,
                        onSaved: (map) {
                          print(map);
                        },
                        errorField: "Please choose a manufacturer",
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      OptionsWidget(options: [
                        ['Yes', 'yes'],
                        ['No', 'no']
                      ], title: "Do you own cattle?"),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintStyle: GoogleFonts.poppins(
                                  color: colors.darkSecondaryTextColor),
                              contentPadding: EdgeInsets.all(7.0),
                              hintText: "Enter income in Rupees",
                              label: Text('Income from cattle',style: GoogleFonts.poppins(
                                  color: colors.darkSecondaryTextColor),)),
                          autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.number,

                        ),
                      ),
                      OptionsWidget(
                        options: [
                          ['Yes', 'yes'],
                          ['No', 'no']
                        ],
                        title: "Do you own farmland?",
                      ),
                      OptionsWidget(
                        options: [
                          ['Yes', 'yes'],
                          ['No', 'no']
                        ],
                        title: "Do you preserve seeds?",
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                        child: TagTextWidget(
                            label: "Seeds Preserved",
                            hint: "Enter seed names here",
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                            autofillHints: ['This','is','a','test'],
                            onSaved: (data) {
                              for (var i in data!) {
                                print(i);
                              }
                            }),
                      ),
                      //TODO: Display if answer to previous question is yes
                      //TODO: Add autosuggest text widget for seeds preserved
                      //TODO: Add autosuggest text widget for locally consumed food
                      //TODO: Add autosuggest text widget for trees owned
                      OptionsWidget(
                        options: [
                          ['Yes', 'yes'],
                          ['No', 'no']
                        ],
                        title: "Do you have a kitchen garden?",
                      ),
                      //TODO: Add autosuggest text widget for kitchen garden crops
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: TextFormField(
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
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: TextFormField(
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
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: TextFormField(
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
                  )
                ], _onSubmit))));
  }
}
