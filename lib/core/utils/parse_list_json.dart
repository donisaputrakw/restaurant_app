import 'dart:convert';

import 'package:restaurant_app/core/core.dart';

List<RestaurantModel> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final List<RestaurantModel> parsed = List<RestaurantModel>.from(
      jsonDecode(json)['restaurants'].map((x) => RestaurantModel.fromJson(x)));
  return parsed;
}
