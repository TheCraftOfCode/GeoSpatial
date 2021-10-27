import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/PageViewContentBox.dart';
import 'package:geo_spatial/Widgets/StepCounterWidget.dart';
import 'package:geolocator/geolocator.dart';

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

  _navigatePageLeft() {
    controller.previousPage(
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  _navigatePageRight() {
    controller.nextPage(
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
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
          StepCounterWidget(3, count, [false, false, false]),
          Expanded(
              child: Container(
            child: PageView(
              onPageChanged: _onPageViewChange,
              physics: new NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: controller,
              children: [
                Center(
                    child: PageViewContentBox(
                        FloatingActionButton.extended(
                          onPressed: () {
                            _determinePosition().then((val) {
                              print(val);
                            }).catchError((error, stackTrace) {
                              print("outer: $error");
                            });
                          },
                          label: Text('Get location'),
                          heroTag: "Get location",
                        ),)),
                Center(
                  child: PageViewContentBox(Text('Second Page')),
                ),
                Center(
                  child: PageViewContentBox(Text('Third Page')),
                ),
                Center(
                    child: PageViewContentBox(
                        Text('Submission')))
              ],
            ),
          )),
        ],
      ),
    );
  }
}

/**
 * Method to get fine location  when requested
 * Type future, requires then and catchError
 *
 * @param:
 * none
 *
 * @returns:
 * Future.error, in case of exceptions
 * Position, in case of success
 *
 * Cannot modularise method into separate class
 */

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error(
        'Location services are disabled, try enabling location in your device');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, permission cannot be requested.');
  }

  return await Geolocator.getCurrentPosition();
}
