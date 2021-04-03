import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class MyPreferences {
  static String _coinsKey = "SAVED_COINS";
  static SharedPreferences _prefsInstance;
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  // this method must be called from the app init
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }
  
  static List<String> getCoinsList() {
    return _prefsInstance.getStringList(_coinsKey) ?? [] ;
  }

  static Future<bool> addToCoinList(String value) async {
    final actualList = getCoinsList();
    actualList.add(value);
    return _prefsInstance?.setStringList(_coinsKey, actualList) ?? Future.value(false);
  }
}
