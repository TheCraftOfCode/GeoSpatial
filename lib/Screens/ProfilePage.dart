import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_spatial/Screens/ChangePassword.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Utils/Globals.dart' as globals;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        SvgPicture.asset(
          'assets/svg/profile_bg.svg',
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarBackButton(
                'Profile',
                actions: [
                  IconButton(
                      onPressed: () async {
                        await storage.delete(key: 'jwt');
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Login()),
                            (Route<dynamic> route) => false);
                      },
                      icon: Icon(
                        Icons.logout,
                        color: colors.darkAccentColor,
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Center(
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/avatar_woman.png")),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        globals.Name,
                        style: GoogleFonts.poppins(fontSize: 20),
                      ),
                    ),
                    Text(
                      '@' + globals.userName,
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: colors.darkSecondaryTextColor),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 6, left: 20),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary:
                                colors.darkSecondaryTextColor.withOpacity(0.2),
                          ),
                          onPressed: () {
                            print('Button Clicked');
                            Route route = MaterialPageRoute(builder: (context) => ChangePassword());
                            Navigator.push(context, route);
                          },
                          icon: Icon(
                            Icons.lock,
                            color: colors.darkAccentColor,
                          ),
                          label: Text(
                            'Change\nPassword',
                            style: GoogleFonts.poppins(
                                color: colors.darkPrimaryTextColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 6, right: 20),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary:
                                colors.darkSecondaryTextColor.withOpacity(0.2),
                          ),
                          onPressed: () {
                            print('Button Clicked');
                            _displayTextInputDialog(context);
                          },
                          label: Text(
                            'Change\nUsername',
                            style: GoogleFonts.poppins(
                                color: colors.darkPrimaryTextColor),
                            textAlign: TextAlign.center,
                          ),
                          icon: Icon(
                            Icons.person,
                            color: colors.darkAccentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        padding: EdgeInsets.only(top: 15, left: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xff34344B)),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text('Joined on: '),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 20.0),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xff34344B)),
                      height: 50,
                      child: Text('Records collected: '),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

Future<void> _displayTextInputDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        var _textFieldController = TextEditingController();
        return AlertDialog(
          backgroundColor: colors.darkScaffoldColor,
            title: Text('Enter Name',style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),),
            content: TextField(
              style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
              onChanged: (value) {},
              controller: _textFieldController = TextEditingController(),
              decoration: InputDecoration(hintText: "Text Field in Dialog",hintStyle: GoogleFonts.poppins(color: colors.darkSecondaryTextColor)),
            ),
            actions: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: colors.darkAccentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      textStyle: GoogleFonts.poppins(
                          color: colors.darkPrimaryTextColor)),
                  child: Text(
                    'OK',
                    style:
                        GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
                  ),
                  onPressed: () {
                    if(_textFieldController.text!=null)
                      globals.Name = _textFieldController.text;
                    Navigator.pop(context);
                  })
            ]);
      });
}
