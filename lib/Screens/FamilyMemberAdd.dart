import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DatePicker.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';

class FamilyMemberAdd extends StatefulWidget {
  const FamilyMemberAdd({Key? key}) : super(key: key);

  @override
  _FamilyMemberAddState createState() => _FamilyMemberAddState();
}

class _FamilyMemberAddState extends State<FamilyMemberAdd> {
  _onSubmit(bool isValid) {
    print(isValid.toString());
  }

  int count = 0;
  final PageController controller = PageController(initialPage: 0);

  final List<GlobalObjectKey<FormState>> formKeyList =
      List.generate(3, (index) => GlobalObjectKey<FormState>(index));
  final error = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAE7FA),
      appBar: AppBarBackButton('Add Family Member'),
      body: FormPageView([
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(),
              validator: (value) {
                if (value == "") {
                  return "Please enter a name";
                } else
                  return null;
              },
              autovalidateMode: AutovalidateMode.always,
            ),
            DatePicker(),
            GenderPickerWithImage(
              verticalAlignedText: false,
              selectedGender: Gender.Male,
              selectedGenderTextStyle: TextStyle(
                  color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
              unSelectedGenderTextStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
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
              decoration: InputDecoration(),
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
              validator: (value) {
                if (value == "") {
                  return "Please enter a value";
                } else if (value!.length != 10) {
                  return "Enter a valid Aadhaar";
                } else
                  return null;
              },
              autovalidateMode: AutovalidateMode.always,
            ),
            DropDownFormField(
              //TODO: Replace with a checkbox dialogue
              list: [
                'Widower',
                'Divorcee',
                'Differently abled'
              ],
              hint: "Select applicable",
              title: "Vulnerabilities",
              errorField: "Please choose a vulnerability",
            ),
            DropDownFormField(
              list: [
                'Clerical support worker',
                'Services and sales worker',
                'Skilled agricultural, forestry and fishery worker',
                'Unemployed'
              ],
              hint: "Select applicable",
              title: "Occupation",
              errorField: "Please choose an occupation",
            ),
          ],
        ),
        Text('Haha Hi')
      ], _onSubmit),
    );
  }
}
