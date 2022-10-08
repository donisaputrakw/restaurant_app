import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheManager {
  /// WRITE DATA
  static Future<bool> writeInt(String key, int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = await prefs.setInt(key, data);
    return result;
  }

  static Future<bool> writeDouble(String key, double data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = await prefs.setDouble(key, data);
    return result;
  }

  static Future<bool> writeString(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = await prefs.setString(key, data);
    return result;
  }

  static Future<bool> writeList(String key, List<String> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = await prefs.setStringList(key, data);
    return result;
  }

  static Future<bool> writeBool(String key, bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = await prefs.setBool(key, data);
    return result;
  }

  /// LOAD DATA
  static Future<int?> loadInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = prefs.getInt(key);
    return result;
  }

  static Future<double?> loadDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = prefs.getDouble(key);
    return result;
  }

  static Future<String?> loadString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = prefs.getString(key);
    return result;
  }

  static Future<List<String>> loadListString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = prefs.getStringList(key);
    return result ?? [];
  }

  static Future<bool> loadBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = prefs.getBool(key);
    return result ?? false;
  }

  /// CLEAR DATA
  static Future<bool> clear(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = await prefs.remove(key);
    return result;
  }
}
