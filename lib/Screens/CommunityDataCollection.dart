import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/StepCounterWidget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CommunityDataCollection extends StatefulWidget {
  const CommunityDataCollection({Key? key}) : super(key: key);

  @override
  _CommunityDataCollectionState createState() =>
      _CommunityDataCollectionState();
}

class _CommunityDataCollectionState extends State<CommunityDataCollection> {
  int count = 0;
  final PageController controller = PageController(initialPage: 0);

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
      appBar: AppBarBackButton('Community Data'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StepCounterWidget(3, count),
          Expanded(
              child: Container(
            child: PageView(
              onPageChanged: _onPageViewChange,
              physics: new NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: controller,
              children: [
                Center(
                  child: Text('First Page'),
                ),
                Center(
                  child: Text('Second Page'),
                ),
                Center(
                  child: Text('Third Page'),
                ),
                Center(
                  child: Text('Submission'),
                )
              ],
            ),
          )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                child: Icon(Icons.arrow_left),
                onPressed: () {
                  controller.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              ),
              FloatingActionButton(
                  child: Icon(Icons.arrow_right),
                  onPressed: () {
                    controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  })
            ],
          )
        ],
      ),
    );
  }
}
