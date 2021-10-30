import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/FamilyAddScreens/PageOne.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/PageViewContentBox.dart';
import 'package:geo_spatial/Widgets/StepCounterWidget.dart';

class FamilyMemberAdd extends StatefulWidget {
  const FamilyMemberAdd({Key? key}) : super(key: key);

  @override
  _FamilyMemberAddState createState() => _FamilyMemberAddState();
}

class _FamilyMemberAddState extends State<FamilyMemberAdd> {
  final formKey = GlobalKey<FormState>();
  final List<GlobalObjectKey<FormState>> formKeyList =
      List.generate(6, (index) => GlobalObjectKey<FormState>(index));

  int count = 0;
  final PageController _controller = PageController(initialPage: 0);
  var errorArray = [false, false, false, false, false, false];

  _onPageViewChange(int page) {
    print(page);
    for (int i = 0; i < page; i++) {
      setState(() {
        errorArray[i] = !formKeyList[i].currentState!.validate();
      });
    }
    setState(() {
      count = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAE7FA),
      appBar: AppBarBackButton('Add Family Member'),
      body: Column(
        children: [
          StepCounterWidget(6, count, errorArray),
          Expanded(
              child: Container(
            child: PageView(
              onPageChanged: _onPageViewChange,
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                PageViewContentBox(PageOne(formKeyList[0])),
                PageViewContentBox(PageOne(formKeyList[1])),
                PageViewContentBox(PageOne(formKeyList[2])),
                PageViewContentBox(PageOne(formKeyList[3])),
                PageViewContentBox(PageOne(formKeyList[4])),
                PageViewContentBox(PageOne(formKeyList[5])),
                Center(child: PageViewContentBox(Text('Submission')))
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  label: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  icon: Icon(
                    Icons.cancel_outlined,
                    size: 40,
                    color: Colors.red,
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_outlined,
                    size: 40,
                    color: Colors.green,
                  ),
                  label: Text(
                    'Submit',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    //shape:,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
