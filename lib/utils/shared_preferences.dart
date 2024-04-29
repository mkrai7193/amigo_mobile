import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _prefs;

  AppPreferences({required SharedPreferences prefs}) : _prefs = prefs;

  static Future<AppPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return AppPreferences(prefs: prefs);
  }

  String getSharedPreferences(String key, {String defaultValue = ''}) {
    return _prefs.getString(key) ?? defaultValue;
  }

  bool getBoolSharedPreferences(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  bool getIsFirstInstallPreferences(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  Future<bool> saveSharedPreferences(String key, String value) {
    return _prefs.setString(key, value);
  }

  Future<bool> saveBoolSharedPreferences(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  Future<bool> saveIsFirstInstallPreferences(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  Future<bool> removePreferences(String key) {
    return _prefs.remove(key);
  }

  Future<bool> clearAllData() {
    return _prefs.clear();
  }
}
