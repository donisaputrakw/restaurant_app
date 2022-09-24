part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchRestaurantEvent extends SearchEvent {
  const SearchRestaurantEvent({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}
