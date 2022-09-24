import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/core.dart';

class SearchRestaurantsModel extends Equatable {
  const SearchRestaurantsModel({
    required this.error,
    this.founded,
    required this.restaurants,
  });

  final bool error;
  final int? founded;
  final List<Restaurant> restaurants;

  factory SearchRestaurantsModel.fromJson(Map<String, dynamic> json) =>
      SearchRestaurantsModel(
        error: json['error'],
        founded: json['founded'] ?? 0,
        restaurants: List<Restaurant>.from(
          json['restaurants'].map((x) => Restaurant.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'founded': founded,
        'restaurants': List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [error, founded, restaurants];
}
