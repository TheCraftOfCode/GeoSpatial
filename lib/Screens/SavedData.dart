import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
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
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.people)),
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
            style: GoogleFonts.montserrat(fontSize: 20, color: colors.darkPrimaryTextColor),
          ),
        ),
        backgroundColor: colors.darkScaffoldColor,
        body: SafeArea(
         child: const TabBarView(
           children: [
             SavedListWidget(list: [],),
             SavedListWidget(list: ['Hye', 'hey', 'sad'],),
           ],
         ),
        ),
      ),
    );
  }
}

class SavedListWidget extends StatelessWidget {
  const SavedListWidget({Key? key, required this.list}) : super(key: key);

  final list;

  @override
  Widget build(BuildContext context) {
     return list.isEmpty ? Center(child: Text('No Saved Items')) : ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(list[index]),);
      },
    );
  }
}

