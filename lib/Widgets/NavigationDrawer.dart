import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;


class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: colors.darkScaffoldColor,
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 50,),
            buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onTap: (){}
            ),
              buildMenuItem(
                  text: 'Profile',
                  icon: Icons.person,
                  onTap: (){}
              ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
  required String text,
    required IconData icon,
    Function? onTap,
}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(leading: Icon(icon,color: colors.darkPrimaryTextColor,),
        title: Text(text,style: GoogleFonts.poppins(color: colors.darkPrimaryTextColor),),
        onTap: onTap!(),
      ),
    );
  }
}
