import 'package:flutter/material.dart';
import 'package:geo_spatial/Screens/Login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Screens/Home.dart';
import 'package:flutter/services.dart';
import 'package:geo_spatial/Utils/DarkTheme.dart';
import 'package:geo_spatial/Widgets/LoadValidPageWidget.dart';
import 'package:oktoast/oktoast.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

final storage = FlutterSecureStorage();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(OKToast(
    position: ToastPosition.center,
    backgroundColor: colors.darkAccentColor,
    child: MaterialApp(
        home: LoadValidPageWidget(Login(), Home()),
        debugShowCheckedModeBanner: false,
        theme: darkTheme.DarkTheme),
  ));
}
