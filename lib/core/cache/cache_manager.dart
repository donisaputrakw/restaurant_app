import 'dart:convert';
import 'package:restaurant_app/core/cache/cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheManager {
/*
* This function will return cached data if exist, 
* If not exist, will create new cached data.
* 
* @return Cache.content
*/
  static Future remember(String key, var data, [int? expiredAt]) async {
    if (await load(key) == null) {
      if (data is Function) {
        data = await data();
      }

      return write(key, data, expiredAt);
    }

    return load(key);
  }

/*
* This will overwrite data if exist and create new if not.
*
* @return Cache.content
*/
  static Future write(String key, var data, [int? expiredAfter]) async {
    CacheType cache = CacheType(key, data);
    if (expiredAfter != null) cache.setExpiredAfter(expiredAfter);

    cache.save(cache);

    return load(key);
  }

/*
* load saved cached data.
*
* @return Cache.content
*/
  static Future load(String key, [var defaultValue, bool list = false]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Guard
    if (prefs.getString(key) == null) return defaultValue;

    if (CacheType.isExpired(prefs.getInt('${key}ExpiredAt'))) {
      destroy(key);
      return null;
    }

    Map keys = jsonDecode(prefs.getString(key)!);
    CacheType cache = CacheType.rebuild(key);
    String? cacheType = prefs.getString(keys['type']);
    // ignore: prefer_typing_uninitialized_variables
    var cacheContent;

    if (cacheType == 'String') cacheContent = prefs.getString(keys['content']);

    if (cacheType == 'Map') {
      cacheContent = jsonDecode(prefs.getString(keys['content'])!);
    }

    if (cacheType == 'List<String>') {
      cacheContent = prefs.getStringList(keys['content']);
    }

    if (cacheType == 'List<Map>') {
      cacheContent = prefs
          .getStringList(keys['content'])!
          .map((i) => jsonDecode(i))
          .toList();
    }

    cache.setContent(cacheContent, keys['content']);
    cache.setType(cacheType, keys['type']);

    return cache.content;
  }

/*
* will clear all shared preference data
*
* @return void
*/
  static void clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

/*
* unset single shared preference key
*
* @return void
*/
  static void destroy(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map keys = jsonDecode(prefs.getString(key)!);

    // remove all cache trace
    prefs.remove(key);
    prefs.remove(keys['content']);
    prefs.remove(keys['type']);
    prefs.remove('$key ExpiredAt');
  }

  static Future<bool> writeBool(String key, bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = await prefs.setBool(key, data);

    return result;
  }

  static Future<bool> loadBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = prefs.getBool(key);

    return result ?? false;
  }
}
