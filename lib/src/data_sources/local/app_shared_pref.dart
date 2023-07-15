import 'package:shared_preferences/shared_preferences.dart';

enum AppSharedKeys {
  theme,
  language,
  apiToken,
  appVersion,
  currentUser,
  listOrders,
  curOrder
}

class AppSharedPref {

  AppSharedPref._();
  static final AppSharedPref _appSharedPref = AppSharedPref._();
  factory AppSharedPref.instance() => _appSharedPref;

  void putBoolean({
    required AppSharedKeys key,
    required bool value,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key.name, value);
  }

  Future<bool?> getBoolean({required AppSharedKeys key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool(key.name);
  }

  void putString({
    required AppSharedKeys key,
    required String? value,
  }) async {
    print("save : $value" );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key.name, value ?? "");
  }

  Future<String> getString({required AppSharedKeys key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.name) ?? "";
  }

  Future<void> setString({required AppSharedKeys key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key.name, value) ?? "";
  }

  Future<bool>? clearShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  Future<String> getCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppSharedKeys.language.name) ?? "en";
  }
}