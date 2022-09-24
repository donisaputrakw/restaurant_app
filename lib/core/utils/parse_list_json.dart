import 'dart:convert';

import 'package:restaurant_app/core/core.dart';

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final List<Restaurant> parsed = List<Restaurant>.from(
      jsonDecode(json)['restaurants'].map((x) => Restaurant.fromJson(x)));
  return parsed;
}
