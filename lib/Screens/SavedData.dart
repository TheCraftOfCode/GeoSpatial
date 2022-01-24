import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Model/CommunityDataModel.dart';
import 'package:geo_spatial/Model/FamilyDataModels.dart';
import 'package:geo_spatial/Screens/CommunityDataCollection.dart';
import 'package:geo_spatial/Screens/FamilyHomeScreen.dart';
import 'package:geo_spatial/Utils/Constants.dart';
import 'package:geo_spatial/Utils/StoreInstance.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/objectbox.g.dart';
import 'package:google_fonts/google_fonts.dart';

final storage = FlutterSecureStorage();

_getUserID() async {
  var userData = await storage.read(key: USER_DATA_KEY);
  if (userData == null) return "";

  var dataJson = json.decode(userData);
  print("dataJson ${dataJson} ${userData}");
  return dataJson[0]["username"];
}

class SavedDataPage extends StatelessWidget {
  const SavedDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.apartment,
                color: colors.darkPrimaryTextColor,
              )),
              Tab(
                  icon: Icon(
                Icons.people,
                color: colors.darkPrimaryTextColor,
              )),
            ],
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.arrow_back,
                color: colors.darkAccentColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Saved Data",
            style: GoogleFonts.montserrat(
                fontSize: 20, color: colors.darkPrimaryTextColor),
          ),
        ),
        backgroundColor: colors.darkScaffoldColor,
        body: SafeArea(
          child: TabBarView(
            children: [CommunitySavedListWidget(), FamilySavedListWidget()],
          ),
        ),
      ),
    );
  }
}

class CommunitySavedListWidget extends StatefulWidget {
  const CommunitySavedListWidget({Key? key}) : super(key: key);

  @override
  State<CommunitySavedListWidget> createState() =>
      _CommunitySavedListWidgetState();
}

class _CommunitySavedListWidgetState extends State<CommunitySavedListWidget> {
  Future<List> getList() async {
    String userId = await _getUserID();
    var store = await StoreInstance.getInstance();
    final box = store.box<CommunityDataModel>();
    //box.query().build().find();
    List? list = box
        .query(CommunityDataModel_.recordCollectingUserId.equals(userId))
        .build()
        .find();
    return await list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getList(),
        builder: (context, AsyncSnapshot<List> data) {
          if (data.data != null) {
            List? list = data.data;
            if (list != null) {
              if (list.isEmpty) {
                return Center(child: Text('No Saved Items'));
              } else {
                list = list.reversed.toList();
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(3),
                      child: Card(
                        color: colors.darkSecondBackgroundColor,
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ID: ${list![index].id}, Resource: ${list[index].resourceType ?? "Not Specified"}",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                              Text(
                                list[index].savedTime ?? "",
                                style: GoogleFonts.poppins(
                                    color: Colors.white38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CommunityDataCollection(
                                      modelData: list![index],
                                    )));
                          },
                          trailing: IconButton(
                            color: colors.darkSecondAccentColor,
                            icon: Icon(Icons.close),
                            onPressed: () async {
                              var store = await StoreInstance.getInstance();
                              final box = store.box<CommunityDataModel>();
                              await box.remove(list![index].id);
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              return Center(child: Text('No Saved Items'));
            }
          } else
            return Center(child: Text('No Saved Items'));
        });
  }
}

class FamilySavedListWidget extends StatefulWidget {
  const FamilySavedListWidget({Key? key}) : super(key: key);

  @override
  State<FamilySavedListWidget> createState() => _FamilySavedListWidgetState();
}

class _FamilySavedListWidgetState extends State<FamilySavedListWidget> {
  Future<List> getList() async {
    String userId = await _getUserID();
    var store = await StoreInstance.getInstance();
    final box = store.box<FamilyMembersCommonDataModel>();
    List? list = box
        .query(
            FamilyMembersCommonDataModel_.recordCollectingUserId.equals(userId))
        .build()
        .find();
    return await list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getList(),
        builder: (context, AsyncSnapshot<List> data) {
          if (data.data != null) {
            List? list = data.data;
            if (list != null) {
              if (list.isEmpty) {
                return Center(child: Text('No Saved Items'));
              } else {
                list = list.reversed.toList();
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(3),
                      child: Card(
                        color: colors.darkSecondBackgroundColor,
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ID: ${list![index].id}, Individual Data",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                              Text(
                                list[index].savedTime ?? "",
                                style: GoogleFonts.poppins(
                                    color: Colors.white38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FamilyHomeScreen(
                                      modelData: list![index],
                                    )));
                          },
                          trailing: IconButton(
                            color: colors.darkSecondAccentColor,
                            icon: Icon(Icons.close),
                            onPressed: () async {
                              var store = await StoreInstance.getInstance();
                              final box =
                                  store.box<FamilyMembersCommonDataModel>();
                              await box.remove(list![index].id);
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              return Center(child: Text('No Saved Items'));
            }
          } else
            return Center(child: Text('No Saved Items'));
        });
  }
}
