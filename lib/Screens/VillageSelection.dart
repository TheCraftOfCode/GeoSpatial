import 'package:flutter/material.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Widgets/CheckBoxAlertDialog.dart';
import 'package:google_fonts/google_fonts.dart';

class VillageSelectionScreen extends StatefulWidget {
  VillageSelectionScreen({Key? key}) : super(key: key);

  @override
  _VillageSelectionScreenState createState() => _VillageSelectionScreenState();

  var villages = {
        'ID1':false,
      'ID2':false,
      'ID3':false
    };

  var isGenerated = false;

}


class _VillageSelectionScreenState extends State<VillageSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.darkScaffoldColor,
      appBar: AppBarBackButton('Generate UID'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: colors.darkSecondBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  height: MediaQuery.of(context).size.height*0.80,
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckBoxAlertDialog(
                        title: "Choose Village Code",
                        context: context,
                        hint: 'Choose here',
                        dataMap: widget.villages,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              child: Text("Generate UID", style: GoogleFonts.poppins(fontSize: 15)),
                              style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      colors.darkScaffoldColor),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: colors.darkScaffoldColor)))),
                              onPressed: () {
                                widget.isGenerated = true;
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}
