import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:geo_spatial/Utils/DarkTheme.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DatePicker.dart';
import 'package:geo_spatial/Widgets/DatePickerWidget.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/OptionsFormWidget.dart';

class FamilyMemberAdd extends StatefulWidget {
  const FamilyMemberAdd({Key? key}) : super(key: key);

  @override
  _FamilyMemberAddState createState() => _FamilyMemberAddState();
}

class _FamilyMemberAddState extends State<FamilyMemberAdd> {
  _onSubmit(bool isValid) {
    print(isValid.toString());
  }

  bool dailyWageWorker = false;

  int count = 0;
  final PageController controller = PageController(initialPage: 0);

  final List<GlobalObjectKey<FormState>> formKeyList =
      List.generate(3, (index) => GlobalObjectKey<FormState>(index));
  final error = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBarBackButton('Add Family Member'),
      body: SizedBox(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).viewInsets.bottom * 1.1,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: FormPageView([
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Name"),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Please enter a name";
                    } else
                      return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                DatePickerWidget(
                  context: context,
                  title: "Date of Birth",
                  hint: "Choose a date",
                  autoValidateMode: AutovalidateMode.always,
                  onSaved: (data){
                    print(data);
                  },
                ),
                GenderPickerWithImage(
                  verticalAlignedText: false,
                  selectedGender: Gender.Male,
                  selectedGenderTextStyle: TextStyle(
                      color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
                  unSelectedGenderTextStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                  onChanged: (Gender? gender) {
                    print(gender);
                  },
                  equallyAligned: true,
                  animationDuration: Duration(milliseconds: 300),
                  isCircular: true,
                  // default : true,
                  opacityOfGradient: 0.4,
                  padding: const EdgeInsets.all(3),
                  size: 70, //default : 40
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
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Phone Number: "),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Please enter a value";
                    } else if (value!.length != 10) {
                      return "Enter a valid number";
                    } else
                      return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Aadhaar Number'),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Enter 12 digit Aadhaar";
                    } else if (value!.length != 12) {
                      return "Enter a valid Aadhaar";
                    } else
                      return null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
                DropDownFormField(
                  //TODO: Replace with a CheckBoxListTile
                  list: [
                    'Widower',
                    'Divorcee',
                    'Differently abled',
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
                TextFormField(
                  decoration: InputDecoration(label: Text('Income/day')),
                  validator: (value) {
                    if (value == "") {
                      return "Enter Income/Day";
                    }
                  },
                )
              ],
            ),
            Column(children: [
              //TODO: Add work timings
              TextFormField(
                decoration: InputDecoration(label: Text('Income/month')),
                validator: (value) {
                  if (value == "") {
                    return "Enter Income/Day";
                  }
                },
              ),
              Column(
                children: [
                  OptionsWidget(
                    options: [
                      ["Eligible", "eligible"],
                      ["Eligible, receiving", "eligible_receiving"],
                      ["Not eligible", "not_eligible"]
                    ],
                    title: 'Old age pension',
                  ),
                ],
              ),
              OptionsWidget(
                options: [
                  ["Yes", "yes"],
                  ["No", "no"],
                ],
                title: 'Doing/Did business',
              ),
              OptionsWidget(
                options: [
                  ["Married", "married"],
                  ["Unmarried", "unmarried"],
                ],
                title: 'Marital Status',
              ),
              TextFormField(
                //TODO: Replace with a custom widget
                decoration: InputDecoration(label: Text('Special Skills')),
              ),
            ]),
            Column(
              children: [
                TextFormField(
                  //TODO: Replace with a custom widget
                  decoration: InputDecoration(label: Text('Frequent ailments')),
                ),
                TextFormField(
                  //TODO: Replace with a custom widget
                  decoration:
                      InputDecoration(label: Text('Communicable Diseases')),
                ),
                TextFormField(
                  //TODO? Replace with a custom widget
                  decoration:
                      InputDecoration(label: Text('Non Communicable Diseases')),
                ),
                OptionsWidget(
                  options: [
                    ["Yes", "yes"],
                    ["No", "no"],
                  ],
                  title: 'Surgeries',
                ),
                OptionsWidget(
                  options: [
                    ["Yes", "yes"],
                    ["No", "no"],
                  ],
                  title: 'Aware about Anganwadi services?',
                ),
                OptionsWidget(
                  options: [
                    ["Yes", "yes"],
                    ["No", "no"],
                  ],
                  title: 'Using any Anganwadi services?',
                ),
                //TODO: Display next widget only if the previous widget is true
                //TODO: Find out list of Anganwadi services, list em in a checkerbox dialog
              ],
            ),
            Column(
              children: [
                //TODO: Add a checkbox dialog for PHC services utilised
                //TODO: Add a checkbox dialog for private heath clinic facilities used
                TextFormField(
                  decoration: InputDecoration(label: Text('Why private?')),
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
