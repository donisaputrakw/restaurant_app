import 'package:equatable/equatable.dart';

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
  List<Object?> get props => [error, message, restaurants];
}

class Restaurant extends Equatable {
  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: json['rating'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'pictureId': pictureId,
        'city': city,
        'rating': rating,
      };

  @override
  List<Object?> get props => [id, name, description, pictureId, city, rating];
}
