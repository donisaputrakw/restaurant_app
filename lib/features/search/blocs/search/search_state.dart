part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  const SearchSuccess({required this.data});

  final SearchRestaurantsModel data;

  @override
  List<Object> get props => [data];
}

class SearchFailure extends SearchState {
  const SearchFailure(this.failureMessage);

  final String failureMessage;

  @override
  List<Object> get props => [failureMessage];
}

class NotConnectedSearch extends SearchState {
  const NotConnectedSearch(this.failureMessage);

  final String failureMessage;

  @override
  List<Object> get props => [failureMessage];
}
