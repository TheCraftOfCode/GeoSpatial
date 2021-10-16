import 'package:flutter/material.dart';
import 'package:geo_spatial/main.dart' as main;
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: main.theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 30, top: 40),
                    child: Text(
                      'Geo Title (temp)',
                      style: GoogleFonts.montserrat(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    'Login',
                    style: GoogleFonts.montserrat(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                // TODO: Add an image for login
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                  child: Container(
                    width: 250,
                    alignment: Alignment.center,
                    child: TextField(
                      style: GoogleFonts.montserrat(fontSize: 15),
                      decoration: InputDecoration(
                          labelText: 'Phone no',
                          labelStyle: GoogleFonts.montserrat(fontSize: 12)),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                  child: Container(
                    width: 250,
                    child: TextField(
                      style: GoogleFonts.montserrat(fontSize: 15),
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: GoogleFonts.montserrat(fontSize: 12),),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ),
                Container(
                    width: 200,
                    padding: EdgeInsets.only(left: 30, top: 50),
                    child: OutlinedButton.icon(
                      onPressed: () { //HomePage(),
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      label: Text(
                        "LOGIN",
                        style: GoogleFonts.montserrat(
                            fontSize: 15, color: Colors.black),
                      ),
                    )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
