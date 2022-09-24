import 'dart:convert';

import 'package:restaurant_app/app/config.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/features/search/search.dart';

abstract class SearchApiDataSource {
  Future<SearchRestaurantsModel> searchRestaurants({required String query});
}

class SearchApiDataSourceImpl implements SearchApiDataSource {
  final String baseUrl = AppConfig.apiUrl;

  @override
  Future<SearchRestaurantsModel> searchRestaurants({
    required String query,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search?q=$query'),
      );

      return SearchRestaurantsModel.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}
