import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;
import 'package:geo_spatial/Widgets/AppBarBackButtonWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarBackButton('Change Password'),
      body: Stack(
        children: [
          SvgPicture.asset('assets/svg/profile_bg.svg', fit: BoxFit.cover),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: SvgPicture.asset(
                    'assets/svg/storage_image.svg',
                  ),
                  height: 200,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    style:
                        GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: colors.darkSecondaryTextColor,
                              width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: colors.successColor, width: 1.0)),
                      label: Text(
                        "Enter new password",
                        style: GoogleFonts.poppins(
                            color: colors.darkSecondaryTextColor),
                      ),
                      hintText: "Enter password here",
                      hintStyle: GoogleFonts.poppins(
                          color: colors.darkSecondaryTextColor),
                      contentPadding: EdgeInsets.all(7.0),
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        if (value.length <= 7) {
                          return "Password too small";
                        }
                      } else
                        return null;
                    },
                    onSaved: (data) {
                      password = data!;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    style:
                        GoogleFonts.poppins(color: colors.darkPrimaryTextColor),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: colors.darkSecondaryTextColor,
                              width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: colors.successColor, width: 1.0)),
                      label: Text(
                        "Re-Enter new password",
                        style: GoogleFonts.poppins(
                            color: colors.darkSecondaryTextColor),
                      ),
                      hintText: "Enter password here",
                      hintStyle: GoogleFonts.poppins(
                          color: colors.darkSecondaryTextColor),
                      contentPadding: EdgeInsets.all(7.0),
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        if (value != password) {
                          return "Passwords do not match";
                        }
                      } else
                        return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      child: Text("Change Password",
                          style: TextStyle(fontSize: 16)),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              colors.lightPrimaryTextColor),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              colors.darkPrimaryTextColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: colors
                                              .darkSecondBackgroundColor)))),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
