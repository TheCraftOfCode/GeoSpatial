import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/PageViewContentBox.dart';
import 'package:geo_spatial/Widgets/StepCounterWidget.dart';

class FamilyMemberAdd extends StatefulWidget {
  const FamilyMemberAdd({Key? key}) : super(key: key);

  @override
  _FamilyMemberAddState createState() => _FamilyMemberAddState();
}

class _FamilyMemberAddState extends State<FamilyMemberAdd> {
  final _formKey = GlobalKey<FormState>();

  int count = 0;
  final PageController _controller = PageController(initialPage: 0);

  _onPageViewChange(int page) {
    print(page);
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
          StepCounterWidget(5, count, []),
          Expanded(
              child: Container(
            child: PageView(
              onPageChanged: _onPageViewChange,
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                PageViewContentBox(pageOne),
                PageViewContentBox(Text('Page 2')),
                PageViewContentBox(Text('Page 3')),
                PageViewContentBox(Text('Page 4')),
                PageViewContentBox(Text('Page 5')),
                PageViewContentBox(Text('Page Check')),
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
                  label: Text('Cancel',style: TextStyle(color: Colors.red,fontSize: 20),),
                  icon: Icon(Icons.cancel_outlined,size: 40,color: Colors.red,),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_outlined,size: 40,color: Colors.green,),
                  label: Text('Submit',style: TextStyle(color: Colors.green,fontSize: 20),),
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

  final pageOne = Column(
      children: [
        Text('Text',textAlign: TextAlign.center,),
      ],
  );
}
