import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Screens/Home.dart';
import 'package:flutter/services.dart';
import 'package:geo_spatial/Utils/Constants.dart';
import 'package:geo_spatial/Utils/DarkTheme.dart';
import 'package:geo_spatial/Widgets/LoadValidPageWidget.dart';
import 'package:oktoast/oktoast.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

//TODO: Build a modular function for HTTP requests

final storage = FlutterSecureStorage();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  var data = await storage.read(key: REMEMBER_ME_KEY);
  var rememberMe = true;
  if (null != data) {
    rememberMe = data == "true";
    if (!rememberMe) {
      await storage.delete(key: JWT_STORAGE_KEY);
    }
  }

  runApp(OKToast(
    position: ToastPosition.center,
    backgroundColor: colors.darkAccentColor,
    child: MaterialApp(
        home: rememberMe ? LoadValidPageWidget(Login(), Home()) : Login(),
        debugShowCheckedModeBanner: false,
        theme: darkTheme.DarkTheme),
  ));
}
