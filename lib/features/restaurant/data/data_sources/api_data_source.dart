import 'dart:convert';

import 'package:restaurant_app/app/config.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/features/restaurant/restaurant.dart';

abstract class RestaurantApiDataSource {
  Future<DetailRestaurantModel> fetchDetailRestaurant({required String id});

  Future<ReviewResponse> sendReview({required ReviewRequest request});
}

class RestaurantApiDataSourceImpl implements RestaurantApiDataSource {
  final String baseUrl = AppConfig.apiUrl;

  @override
  Future<DetailRestaurantModel> fetchDetailRestaurant({
    required String id,
  }) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/detail/$id'));

      return DetailRestaurantModel.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ReviewResponse> sendReview({
    required ReviewRequest request,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/review'),
        body: request.toJson(),
      );

      return ReviewResponse.fromJson(json.decode(response.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}
