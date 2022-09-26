import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/core.dart';

class DetailRestaurantModel extends Equatable {
  const DetailRestaurantModel({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  final bool error;
  final String message;
  final RestaurantX restaurant;

  factory DetailRestaurantModel.fromJson(Map<String, dynamic> json) =>
      DetailRestaurantModel(
        error: json['error'],
        message: json['message'],
        restaurant: RestaurantX.fromJson(json['restaurant']),
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'restaurant': restaurant.toJson(),
      };

  @override
  List<Object?> get props => [error, message, restaurant];
}

class RestaurantX extends Equatable {
  const RestaurantX({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final MenusModel menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  factory RestaurantX.fromJson(Map<String, dynamic> json) => RestaurantX(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        city: json['city'],
        address: json['address'],
        pictureId: json['pictureId'],
        categories: List<Category>.from(
            json['categories'].map((x) => Category.fromJson(x))),
        menus: MenusModel.fromJson(json['menus']),
        rating: json['rating'].toDouble(),
        customerReviews: List<CustomerReview>.from(
            json['customerReviews'].map((x) => CustomerReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'city': city,
        'address': address,
        'pictureId': pictureId,
        'categories': List<dynamic>.from(categories.map((x) => x.toJson())),
        'menus': menus.toJson(),
        'rating': rating,
        'customerReviews':
            List<dynamic>.from(customerReviews.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        city,
        address,
        pictureId,
        categories,
        menus,
        rating,
        customerReviews,
      ];
}

class Category extends Equatable {
  const Category({
    required this.name,
  });

  final String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  @override
  List<Object?> get props => [name];
}

class CustomerReview extends Equatable {
  const CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  final String name;
  final String review;
  final String date;

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json['name'],
        review: json['review'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'review': review,
        'date': date,
      };

  @override
  List<Object?> get props => [name, review, date];
}
