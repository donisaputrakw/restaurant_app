part of 'restaurant_bloc.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantSuccess extends RestaurantState {
  const RestaurantSuccess({required this.data});

  final RestaurantsModel data;

  @override
  List<Object> get props => [data];
}

class RestaurantFailure extends RestaurantState {
  const RestaurantFailure(this.failureMessage);

  final String failureMessage;

  @override
  List<Object> get props => [failureMessage];
}

class NotConnected extends RestaurantState {
  const NotConnected(this.failureMessage);

  final String failureMessage;

  @override
  List<Object> get props => [failureMessage];
}
