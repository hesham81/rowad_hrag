import 'package:shared_preferences/shared_preferences.dart';

abstract class CashHelper {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setString(String key, String value) async {
    await init();
    return await _sharedPreferences.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    await init();
    return _sharedPreferences.getString(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    await init();
    return await _sharedPreferences.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    await init();
    return _sharedPreferences.getBool(key) ?? false;
  }

  static Future<bool> remove(String key) async {
    await init();
    return await _sharedPreferences.remove(key);
  }

  static Future<bool> clear() async {
    await init();
    return await _sharedPreferences.clear();
  }

  static Future<bool> setInt(String key, int value) async {
    await init();
    return await _sharedPreferences.setInt(key, value);
  }

  static Future<int?> getInt(String key) async {
    await init();
    return _sharedPreferences.getInt(key);
  }

  static Future<bool> setDouble(String key, double value) async {
    await init();
    return await _sharedPreferences.setDouble(key, value);
  }

  static Future<double?> getDouble(String key) async {
    await init();
    return _sharedPreferences.getDouble(key);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    await init();
    return await _sharedPreferences.setStringList(key, value);
  }

  static Future<List<String>?> getStringList(String key) async {
    await init();
    return _sharedPreferences.getStringList(key);
  }
}
