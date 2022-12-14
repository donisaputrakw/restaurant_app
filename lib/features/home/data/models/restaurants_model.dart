import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/core.dart';

class RestaurantsModel extends Equatable {
  const RestaurantsModel({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  factory RestaurantsModel.fromJson(Map<String, dynamic> json) =>
      RestaurantsModel(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        restaurants: List<Restaurant>.from(
          json['restaurants'].map((x) => Restaurant.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'count': count,
        'restaurants': List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [error, message, count, restaurants];
}
