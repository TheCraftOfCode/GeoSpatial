import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_spatial/Screens/RenderJSONData.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/Constants.dart';
import 'package:geo_spatial/Utils/Utils.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

//TODO: Parse Data into Family Data Object
class DisplayFamilyData extends StatefulWidget {
  const DisplayFamilyData({Key? key}) : super(key: key);

  @override
  State<DisplayFamilyData> createState() => _DisplayFamilyDataState();
}

class _DisplayFamilyDataState extends State<DisplayFamilyData> {
  bool isSearchOpen = false;
  TextEditingController _textEditingController = new TextEditingController();

  List<String> _dataList = <String>[];
  List _mapData = [];
  late List<String> _searchList;

  initState() {
    super.initState();
    _searchList = _dataList;
  }

  Future<http.Response> _getCommonRecords() async {
    String url = NETWORK_ADDRESS;
    String jwt = await jwtToken;

    try {
      var res = await http
          .get(Uri.http(url, '/api/getCommonRecords/familyData'), headers: {
        "Content-Type": "application/json",
        'user-auth-token': jwt
      }).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          showToast("Server Timed out!");
          return http.Response('Error', 408);
        },
      );
      print(json.decode(res.body));

      return res;
    } catch (e) {
      return http.Response(e.toString(), 408);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getCommonRecords(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.requireData.statusCode != 200) {
              return Scaffold(
                appBar: AppBarBackButton("View Family Data"),
                body: Center(
                  child: Text("Could not fetch data from server at this time"),
                ),
              );
            }

            try {
              var dataJson = json.decode(snapshot.requireData.body);
              _dataList.clear();
              _mapData.clear();
              for (var i in dataJson) {
                _dataList.add(i["FamilyUIN"]);
                _mapData.add(i);
                print(i);
              }
            } catch (e) {
              print(e);
              return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBarBackButton("View Family Data"),
                body: Center(
                  child: Text("Could not fetch data from server at this time"),
                ),
              );
            }

            return Scaffold(
              backgroundColor: colors.darkScaffoldColor,
              appBar: AppBarBackButton(
                'View Family Data',
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            _searchList = _dataList
                                .where((i) => i
                                    .toLowerCase()
                                    .contains(text.toLowerCase()))
                                .toList();
                          });
                        },
                        controller: _textEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: colors.darkSecondaryTextColor,
                                  width: 1.0)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          fillColor: colors.darkScaffoldColor,
                          prefixIcon: Icon(
                            Icons.search,
                            color: colors.darkAccentColor,
                          ),
                          label: Text(
                            "Search",
                            style: GoogleFonts.poppins(
                                color: colors.darkSecondaryTextColor),
                          ),
                          hintText: "Search for records...",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20),
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
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: _searchList.isNotEmpty
                              ? ListView.builder(
                                  itemCount: _searchList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 3.0),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        elevation: 10,
                                        color: colors.darkScaffoldColor,
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20.0),
                                          minLeadingWidth: 30,
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RenderJSONData(
                                                            data: _mapData[
                                                                index])));
                                          },
                                          //Pass a function which is called onSaved in the next page and add data to the class object
                                          title: Text(
                                            _searchList[index],
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20),
                                          ),
                                          subtitle: Text(
                                            'Click to view data',
                                            style: GoogleFonts.poppins(
                                                color: colors
                                                    .darkSecondaryTextColor),
                                          ),
                                          leading: SvgPicture.asset(
                                            "assets/svg/user-id-icon.svg",
                                            fit: BoxFit.fill,
                                          ),
                                          isThreeLine: true,
                                          trailing: IconButton(
                                            icon: Icon(
                                              Icons.delete_forever,
                                              color: colors.darkAccentColor,
                                            ),
                                            onPressed: () {
                                              displayDialog(
                                                context,
                                                positiveFunction: () async {
                                                  var record = _mapData[index];
                                                  Navigator.of(context).pop();

                                                  bool success =
                                                      await deleteRecord({
                                                    "id": record["_id"]
                                                  }, "/api/getCommonRecords/deleteFamilyData",
                                                          context);

                                                  if (success) {
                                                    _mapData.removeAt(index);
                                                    setState(() {});
                                                  }
                                                },
                                                negativeFunction: () {
                                                  Navigator.of(context).pop();
                                                },
                                                title: 'Delete record',
                                                subTitle:
                                                    'Are you sure you want to delete this record?',
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              : Container(
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "No Results Found",
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
                appBar: AppBarBackButton("View Family Data"),
                body: Center(
                  child: CircularProgressIndicator(),
                ));
          }
        });
  }
}