import 'package:flutter/material.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class RenderJSONData extends StatefulWidget {
  const RenderJSONData({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  State<RenderJSONData> createState() => _RenderJSONDataState();
}

class _RenderJSONDataState extends State<RenderJSONData> {
  List<Widget> listData = [];

  buildWidgetList(List jsonData) {
    List<Widget> listData = [];
    int mapCount = 0;
    jsonData.forEach((element) {
      print(element.runtimeType);
      if (element.runtimeType == String ||
          element.runtimeType == double ||
          element.runtimeType == int) {
        listData.add(new Card(
          color: colors.darkSecondBackgroundColor,
          child: ListTile(
            title: Text(
              element.toString(),
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
          ),
          elevation: 3,
        ));
        setState(() {});
      } else if (element.runtimeType == List) {
        listData.add(buildWidgetList(element));
      } else {
        listData.add(Card(
          color: colors.darkSecondBackgroundColor,
          child: ListTile(
            title: Text(
              "Data entry ${mapCount + 1}",
              style: GoogleFonts.poppins(
                  color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),
            ),
            subtitle: buildWidgetMap(element),
          ),
        ));
      }
      mapCount++;
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: listData,
      ),
    );
  }

  buildWidgetMap(data) {
    List<Widget> mapListData = [];
    data.forEach((key, value) {
      print(value.runtimeType);
      if (value.runtimeType == String) {
        mapListData.add(new Card(
          color: colors.darkScaffoldColor,
          child: ListTile(
            title: Text(
              key.toString(),
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
            subtitle: Text(value.toString(), style: GoogleFonts.poppins(
                color: colors
                    .darkSecondaryTextColor)),
          ),
        ));
        setState(() {});
      } else if (value.runtimeType == List) {
        mapListData.add(Card(
          color: colors.darkScaffoldColor,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                key.toString().toUpperCase(),
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
            subtitle: buildWidgetList(value),
          ),
        ));
        setState(() {});
      } else if (value.runtimeType == Map) {
        mapListData.add(new Card(
          color: colors.darkSecondBackgroundColor,
          child: ListTile(
            title: Text(
              key.toString().toUpperCase(),
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 15),
            ),
            subtitle: buildWidgetMap(value),
          ),
        ));
      }
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: mapListData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.darkScaffoldColor,
      appBar: AppBarBackButton("Family Data"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: colors.darkSecondBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color(0xBC252426),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: buildWidgetMap(widget.data),
          ),
        ),
      ),
    );
  }
}
