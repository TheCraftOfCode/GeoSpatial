import 'package:flutter/material.dart';
import 'package:geo_spatial/Model/FamilyMembersCommomDataModel.dart';
import 'package:geo_spatial/Screens/FamilyDetails.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/StoreInstance.dart';
import 'package:geo_spatial/Widgets/AddRemoveBoxWidget.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/DataCard.dart';

import '../objectbox.g.dart';
import 'CollectLocationWidget.dart';

class FamilyHomeScreen extends StatefulWidget {
  const FamilyHomeScreen({Key? key, this.modelData}) : super(key: key);

  @override
  State<FamilyHomeScreen> createState() => _FamilyHomeScreenState();
  final modelData;
}

FamilyMembersCommonDataModel? modelData;

class _FamilyHomeScreenState extends State<FamilyHomeScreen>
    with AutomaticKeepAliveClientMixin {
  var store;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (modelData == null)
      modelData =
          widget.modelData ?? new FamilyMembersCommonDataModel();

    return Scaffold(
      appBar: AppBarBackButton('Individual Data'),
      backgroundColor: colors.darkScaffoldColor,
      body: SafeArea(
        child: Column(
          children: [
            AddRemoveBoxWidget(
              modelData: modelData,
            ),
            DataCard("\nCollect Common Details", "", "assets/svg/house.svg",
                FamilyDetails(), Color(0xfff54b64), Color(0xfff78361)),
            DataCard(
                "Record GPS Data",
                "Make sure GPS is enabled",
                "assets/svg/map.svg",
                CollectLocationWidget(modelData: modelData),
                Color(0xfff54b64),
                Color(0xfff78361)),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 10.0, left: 10.0, right: 10.0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                          child: Text("Submit", style: TextStyle(fontSize: 14)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  colors.darkSecondBackgroundColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: colors
                                              .darkSecondBackgroundColor)))),
                          onPressed: () {}),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                          child: Text("Save",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.white)))),
                          onPressed: () async {
                            store = await StoreInstance.getInstance();
                            Box box = store.box<FamilyMembersCommonDataModel>();
                            await box.put(modelData);
                          }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("DISPOSED");
    modelData = null;
  }

  @override
  bool get wantKeepAlive => true;
}
