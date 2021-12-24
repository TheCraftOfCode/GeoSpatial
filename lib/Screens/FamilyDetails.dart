import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DropDownFormField.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/OptionsFormWidget.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

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
                    children: [
                      OptionsWidget(options: [
                        ['Yes', 'yes'],
                        ['No', 'no']
                      ], title: "Do you have drinking water available?"),
                      //TODO: Source of water if answer is yes
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
                      //TODO: Add dialog checkboxlist for brands of two and three wheelers
                      DropDownFormField(
                        list: ['1', '2', '3', '4', '5', 'More'],
                        hint: "Select the highest",
                        title: "No of four wheelers",
                        errorField: "Please choose a valid number",
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      //TODO: Add brands of four wheelers
                      OptionsWidget(options: [
                        ['Yes', 'yes'],
                        ['No', 'no']
                      ], title: "Do you own cattle?"),
                      //TODO: Display if answer to previous question is yes
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text('Income from cattle: ')),
                        autovalidateMode: AutovalidateMode.always,
                        keyboardType: TextInputType.number,
                      ),
                      OptionsWidget(
                        options: [
                          ['Yes', 'yes'],
                          ['No', 'no']
                        ],
                        title: "Do you own farmland?",
                      ),
                      //TODO: checkbox dialog for crops cultivated
                      OptionsWidget(
                        options: [
                          ['Yes', 'yes'],
                          ['No', 'no']
                        ],
                        title: "Do you preserve seeds?",
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
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text('First line'),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text('Second line'),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text('City'),
                        ),
                      ),
                    ],
                  )
                ], _onSubmit))));
  }
}
