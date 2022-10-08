part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  const FavoriteSuccess({
    required this.isFavorite,
    required this.restaurants,
  });

  final bool isFavorite;
  final List<String> restaurants;

  @override
  List<Object> get props => [isFavorite, restaurants];
}

class FetchSuccess extends FavoriteState {
  const FetchSuccess({
    required this.isFavorite,
    required this.restaurants,
  });

  final bool isFavorite;
  final List<String> restaurants;

  @override
  List<Object> get props => [isFavorite, restaurants];
}

class FavoriteFailure extends FavoriteState {
  const FavoriteFailure(this.failureMessage);

  final String failureMessage;

  @override
  List<Object> get props => [failureMessage];
}
