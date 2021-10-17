import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_spatial/Screens/IndividualDataCollection.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<Home> {
  String userName = '';

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Text(
              'Hello, ' + userName + '!',
              style: GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            leading: IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {},
            )),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardWidget('Individual data', 'Individual data entry for everyone in home', 'assets/svg/female.svg', IndividualDataCollection(),
                  Color(0xFFF700FF), Color(0xFF2B2BFF)),
              CardWidget('Community Details', 'Data entry for communities', 'assets/svg/house.svg', IndividualDataCollection(),
                  Color(0xFF2E2FFF), Color(0xFF4FD586)),
              CardWidget('View saved data', 'View all data saved in local storage', 'assets/svg/storage_image.svg', IndividualDataCollection(),
                  Color(0xFFFFA200), Color(0xFFBA0000)),
            ],
          ),
        ),
      );
  }
}

class CardWidget extends StatelessWidget {
  CardWidget(this.heading, this.subHeading, this.imageUrl, this.route,
      this.startingColor, this.endingColor);

  final String heading;
  final String subHeading;
  final String imageUrl;
  final Widget route;
  final Color startingColor;
  final Color endingColor;

  @override
  Widget build(BuildContext context) {
    return (Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [startingColor, endingColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xBC000000),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: new Material(
            borderRadius: BorderRadius.circular(20),
            child: new InkWell(
              splashColor: Color(0x7EFFFFFF),
              hoverColor: Color(0xABFFFFFF),
              focusColor: Color(0x86FFFFFF),
              highlightColor: Color(0x3CFFFFFF),
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
              },
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(imageUrl),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(heading,
                              style: GoogleFonts.montserrat(
                                  fontSize: 25, color: Colors.white)),
                          Text(subHeading,
                              style: GoogleFonts.montserrat(
                                  fontSize: 15, color: Color(0xFFDCDCDC)))
                        ],
                      ),
                    ),
                    flex: 6,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset('assets/svg/right-icon-arrow.svg',
                          color: Colors.white),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            color: Colors.transparent,
          ),
        ),
      ),
    ));
  }
}
