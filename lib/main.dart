import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Screens/Home.dart';

final storage = FlutterSecureStorage();

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<String> get jwtToken async {
    var jwt = await storage.read(key: "jwt");
    print('jwt' + jwt.toString());

    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: jwtToken,
    //     builder: (context, data) {
    //       if (!data.hasData)
    //         return Login();
    //       else if (data.hasData && data.data == '')
    //         return Login();
    //       else
    //         return Home();
    //     });

    return Home();
  }
}
