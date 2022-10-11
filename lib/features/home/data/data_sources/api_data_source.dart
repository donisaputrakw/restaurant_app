import 'dart:convert';

import 'package:restaurant_app/app/config.dart';
import 'package:restaurant_app/features/home/home.dart';
import 'package:http/http.dart' as http;

abstract class HomeApiDataSource {
  Future<RestaurantsModel> fetchRestaurants(http.Client client);
}

class HomeApiDataSourceImpl implements HomeApiDataSource {
  final String baseUrl = AppConfig.apiUrl;
  @override
  Future<RestaurantsModel> fetchRestaurants(http.Client client) async {
    final response = await client.get(
      Uri.parse('$baseUrl/list'),
    );
    if (response.statusCode == 200) {
      return RestaurantsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}
