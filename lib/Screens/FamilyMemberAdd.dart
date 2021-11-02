import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/FamilyAddScreens/PageOne.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
import 'package:geo_spatial/Widgets/PageViewContentBox.dart';
import 'package:geo_spatial/Widgets/StepCounterWidget.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Hey'),
                Text('Testing column widget')
              ],
            ),
            TextFormField(
              decoration: InputDecoration(),
              validator: (str) {
                if (str == '')
                  return 'Enter field lmao';
                else
                  return null;
              },
            ),
            Text('Haha Hi')
          ], _onSubmit),
      );
  }
}
