part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteEvent extends FavoriteEvent {
  const GetFavoriteEvent({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class AddFavoriteEvent extends FavoriteEvent {
  const AddFavoriteEvent({required this.restaurant});

  final Restaurant restaurant;

  @override
  List<Object> get props => [restaurant];
}

class DeleteFavoriteEvent extends FavoriteEvent {
  const DeleteFavoriteEvent({
    required this.restaurant,
    required this.restaurants,
  });

  final Restaurant restaurant;
  final List<String> restaurants;

  @override
  List<Object> get props => [restaurant, restaurants];
}
