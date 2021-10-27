import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DatePicker.dart';
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
            StepCounterWidget(5, count),
            Expanded(child: Container(
              child: PageView(
                onPageChanged: _onPageViewChange,
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  PageViewContentBox(Text('Page 1'), null,null),
                  PageViewContentBox(Text('Page 2'), null,null),
                  PageViewContentBox(Text('Page 3'), null,null),
                  PageViewContentBox(Text('Page 4'), null,null),
                  PageViewContentBox(Text('Page 5'), null,null),
                  PageViewContentBox(Text('Page Check'), null,null),
                ],
              ),
            ))
          ],
        )
    );
  }
}
