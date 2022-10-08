part of 'favorite_restaurants_bloc.dart';

abstract class FavoriteRestaurantsState extends Equatable {
  const FavoriteRestaurantsState();

  @override
  List<Object> get props => [];
}

class FavoriteRestaurantsInitial extends FavoriteRestaurantsState {}

class FavoriteRestaurantsLoading extends FavoriteRestaurantsState {}

class FavoriteRestaurantsSuccess extends FavoriteRestaurantsState {
  const FavoriteRestaurantsSuccess(this.restaurants);

  final List<String> restaurants;

  @override
  List<Object> get props => [restaurants];
}

class SuccessDeleteFavoriteRestaurant extends FavoriteRestaurantsState {
  const SuccessDeleteFavoriteRestaurant(this.restaurants);

  final List<String> restaurants;

  @override
  List<Object> get props => [restaurants];
}

class FavoriteRestaurantsFailure extends FavoriteRestaurantsState {
  const FavoriteRestaurantsFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
