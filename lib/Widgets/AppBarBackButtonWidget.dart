import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarBackButton extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBackButton(this.title);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  /**
   * Widget for app bars with a back button
   *
   * @param:
   * String title: title to be displayed in app bar
   *
   * @returns:
   * Widget: Returns an AppBar
   */

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
          splashRadius: 20,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
