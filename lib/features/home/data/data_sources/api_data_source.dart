import 'dart:convert';

import 'package:restaurant_app/app/config.dart';
import 'package:restaurant_app/features/home/home.dart';
import 'package:http/http.dart' as http;

abstract class HomeApiDataSource {
  Future<RestaurantsModel> fetchRestaurants();
}

class HomeApiDataSourceImpl implements HomeApiDataSource {
  final String baseUrl = AppConfig.apiUrl;
  @override
  Future<RestaurantsModel> fetchRestaurants() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/list'),
      );

      return RestaurantsModel.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}
