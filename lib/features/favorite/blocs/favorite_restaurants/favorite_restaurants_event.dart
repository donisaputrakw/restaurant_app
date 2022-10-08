part of 'favorite_restaurants_bloc.dart';

abstract class FavoriteRestaurantsEvent extends Equatable {
  const FavoriteRestaurantsEvent();

  @override
  List<Object> get props => [];
}

class GetFavoritesEvent extends FavoriteRestaurantsEvent {}

class DeleteFavoriteRestaurantEvent extends FavoriteRestaurantsEvent {
  const DeleteFavoriteRestaurantEvent({
    required this.restaurant,
    required this.restaurants,
  });

  final Restaurant restaurant;
  final List<String> restaurants;

  @override
  List<Object> get props => [restaurant, restaurants];
}
