import '../main.dart';
import 'Constants.dart';

//TODO: Modularise all data accessing methods
Future<String> get jwtToken async {
  var jwt = await storage.read(key: JWT_STORAGE_KEY);

  if (jwt == null) return "";
  return jwt;
}