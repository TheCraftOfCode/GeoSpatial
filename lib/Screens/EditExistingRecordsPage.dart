import 'package:flutter/material.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

class EditRecordsScreen extends StatefulWidget {
  const EditRecordsScreen({Key? key}) : super(key: key);

  @override
  State<EditRecordsScreen> createState() => _EditRecordsScreenState();
}

class _EditRecordsScreenState extends State<EditRecordsScreen> {
  bool isSearchOpen = false;
  TextEditingController _textEditingController = new TextEditingController();

  List<String> _dataList = <String>["ONE", "TWO", "THREE"];
  late List<String> _searchList;

  initState() {
    super.initState();
    _searchList = _dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButton(
        'Edit Existing Data',
        actions: [
          IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.search,
                color: colors.darkAccentColor,
              ),
              onPressed: () {
                setState(() {
                  isSearchOpen = !isSearchOpen;
                  _searchList = _dataList;
                });
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: isSearchOpen,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
              child: TextField(
                onChanged: (text) {
                  print("INVOKED");
                  setState(() {
                    _searchList = _dataList
                        .where(
                            (i) => i.toLowerCase().contains(text.toLowerCase()))
                        .toList();
                  });
                },
                controller: _textEditingController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: colors.darkSecondaryTextColor, width: 1.0)),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    fillColor: colors.darkSecondBackgroundColor,
                    prefixIcon: Icon(Icons.search),
                    // suffixIcon: Material(
                    //   borderRadius: BorderRadius.only(
                    //       topRight: Radius.circular(4),
                    //       bottomRight: Radius.circular(4)),
                    //   child: IconButton(
                    //     splashRadius: 16,
                    //     icon: Icon(
                    //       Icons.clear,
                    //       color: colors.darkSecondAccentColor,
                    //     ),
                    //     onPressed: () {
                    //       _textEditingController.text = "";
                    //     },
                    //   ),
                    // ),
                    label: Text(
                      "Search",
                      style: GoogleFonts.poppins(
                          color: colors.darkSecondaryTextColor),
                    ),
                    hintText: "Search for records..."),
              ),
            ),
          ),
          ListView.builder(
              itemCount: _searchList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: colors.darkSecondBackgroundColor,
                  //TODO: Replace with better ListTile
                  child: ListTile(
                    onTap: () {},
                    //Pass a function which is called onSaved in the next page and add data to the class object
                    leading: Icon(Icons.person),
                    title: Text(
                      _searchList[index],
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
