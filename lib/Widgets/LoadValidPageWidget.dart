import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

class LoadValidPageWidget extends StatelessWidget{
  LoadValidPageWidget(this.DefaultPage, this.TargetPage);

  final Widget DefaultPage;
  final Widget TargetPage;

  Future<String> get jwtToken async {
    var jwt = await storage.read(key: "jwt");
    print('jwt' + jwt.toString());

    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: jwtToken,
        builder: (context, data) {
          if (!data.hasData)
            return DefaultPage;
          else if (data.hasData && data.data == '')
            return DefaultPage;
          else
            return TargetPage;
        });
  }

}