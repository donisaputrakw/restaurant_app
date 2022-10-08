import 'dart:convert';
import 'package:restaurant_app/core/cache/cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheType {
  late String key;

  /* Cache Content*/
  String? contentKey;
  // ignore: prefer_typing_uninitialized_variables
  var content;

  /* Cache Content's Type*/
  String? typeKey;
  String? type;

  /* Cache Expiry*/
  int? expiredAfter;

  /*
  * Cache Class Constructors Section
  */
  CacheType(this.key, data) {
    Map parsedData = Parse.content(data);
    setContent(parsedData['content']);
    setType(parsedData['type']);
  }

  CacheType.rebuild(this.key);

  /*
  * Cache Class Setters & Getters
  */
  setKey(String key) {
    this.key = key;
  }

  setContent(var data, [String? contentKey]) {
    content = data;
    this.contentKey = contentKey ?? generateCompositeKey('content');
  }

  setType(String? type, [String? typeKey]) {
    this.type = type;
    this.typeKey = typeKey ?? generateCompositeKey('type');
  }

  setExpiredAfter(int expiredAfter) {
    this.expiredAfter = expiredAfter + CacheType.currentTimeInSeconds();
  }

  /*
  * Saved cached contents into Shared Preference
  *
  * @return void
  */
  void save(CacheType cache) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // set Original Cache key to cache content's key and cache type's key
    prefs.setString(cache.key,
        jsonEncode({'content': cache.contentKey, 'type': cache.typeKey}));

    if (cache.content is String) {
      prefs.setString(cache.contentKey!, cache.content);
    }

    if (cache.content is List) {
      prefs.setStringList(cache.contentKey!, cache.content);
    }

    if (cache.expiredAfter != null) {
      prefs.setInt('$key ExpiredAt', cache.expiredAfter!);
    }

    prefs.setString(cache.typeKey!, cache.type!);
  }

  /*
  * Cache Class Helper Function Section
  *
  * This is where all custom functions used by this class reside.
  * All functions should be private.
  */
  String generateCompositeKey(String keyType) {
    return keyType + CacheType.currentTimeInSeconds().toString() + key;
  }

  static int currentTimeInSeconds() {
    var ms = (DateTime.now()).millisecondsSinceEpoch;
    return (ms / 1000).round();
  }

  static bool isExpired(int? cacheExpiryInfo) {
    if (cacheExpiryInfo != null &&
        cacheExpiryInfo < CacheType.currentTimeInSeconds()) {
      return true;
    }

    return false;
  }
}
