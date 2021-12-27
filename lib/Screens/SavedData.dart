import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Model/CommunityDataModel.dart';
import 'package:geo_spatial/Screens/CommunityDataCollection.dart';
import 'package:geo_spatial/Utils/StoreInstance.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

class SavedDataPage extends StatelessWidget {
  const SavedDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.person,
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
            children: [
              SavedListWidget(),
              MaterialButton(
                onPressed: () async {
                  var store = await StoreInstance.getInstance();
                  final box = store.box<CommunityDataModel>();
                  List? list = await box.getAll();
                  for (var i in list) {
                    print(i.id);
                    print(i.resourceType);
                    print(i.villageCode);
                    print(i.locationTopLeft);
                    print(i.locationTopRight);
                    print(i.locationBottomLeft);
                    print(i.locationBottomRight);
                    print(i.resourceType);
                  }
                },
                child: Text("Click me"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SavedListWidget extends StatefulWidget {
  const SavedListWidget({Key? key}) : super(key: key);

  @override
  State<SavedListWidget> createState() => _SavedListWidgetState();
}

class _SavedListWidgetState extends State<SavedListWidget> {
  Future<List> getList() async {
    var store = await StoreInstance.getInstance();
    final box = store.box<CommunityDataModel>();
    List? list = await box.getAll();
    return await list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getList(),
        builder: (context, AsyncSnapshot<List> data) {
          if (data.data != null) {
            print("HAS DATA");
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
                                list![index].resourceType ?? "Empty Resource",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20),
                              ),
                              Text(
                                list[index].savedTime ?? "",
                                style: GoogleFonts.poppins(
                                    color: Colors.white30,
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
                              setState(() {

                              });
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
