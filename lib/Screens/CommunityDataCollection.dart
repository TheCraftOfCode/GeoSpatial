import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/FormPageView.dart';
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

  final List<GlobalObjectKey<FormState>> formKeyList =
      List.generate(3, (index) => GlobalObjectKey<FormState>(index));
  final error = [false, false, false];

  // _navigatePageLeft() {
  //   controller.previousPage(
  //       duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  // }
  //
  // _navigatePageRight() {
  //   controller.nextPage(
  //       duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  // }

  _onSubmit(bool isValid) {
    print(isValid.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAE7FA),
      appBar: AppBarBackButton('Community Data'),
      body: FormPageView([
        Text('Hey'),
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
  //You can set accuracy to high ig, that returns like 6 decimal points. Plenty enough to plot on maps
}

