import 'package:geo_spatial/objectbox.g.dart';

class StoreInstance {
  static var store = null;
  static var box = null;

  static Future<Store> getInstance() async {
    if (store == null) {
      try {
        store = await openStore();
      } catch (error) {
        print(error);
        store.close();
        store = await openStore();
      }
      print("NULL");
    }
    return store;
  }

}
