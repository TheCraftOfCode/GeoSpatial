import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geo_spatial/Utils/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

final storage = FlutterSecureStorage();

/***
 * This widget can be used between usual widgets to avoid rendering
 * new pages when jwt not found.
 *
 * @param:
 * Default Page, page to default to when jwt not found
 * Target Page, page to load if jwt found
 *
 * @returns:
 * Widget, appropriate widget depending on jwt state
 *
 * Usage:
 * LoadValidPageWidget(Login(), Home());
 */

class LoadValidPageWidget extends StatelessWidget {
  LoadValidPageWidget(this.DefaultPage, this.TargetPage, {Key? key})
      : super(key: key);

  final Widget DefaultPage;
  final Widget TargetPage;

  Future<http.Response> _validateToken(String JWT) async {
    String url = NETWORK_ADDRESS;

    var res = await http.get(Uri.http(url, '/api/validateToken'),
        headers: {"Content-Type": "application/json", 'user-auth-token': JWT});
    print("RES: ${res.body}");

    return res;
  }

  Future<String> jwtToken(context) async {
    var jwt = await storage.read(key: JWT_STORAGE_KEY);
    print(JWT_STORAGE_KEY + jwt.toString());

    if (jwt == null) return "";
    try {
      var res = await _validateToken(jwt);
      if (res.statusCode != 200) {
        await storage.delete(key: JWT_STORAGE_KEY);
        showToast("Token could not be validated, logging out");
        return "";
      }
    } catch (e) {
      showToast("Couldn't validate token, continuing in offline mode!");
    }
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: jwtToken(context),
        builder: (context, data) {
          if (!data.hasData)
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          else if (data.hasData && data.data == '')
            return DefaultPage;
          else
            return TargetPage;
        });
  }
}
