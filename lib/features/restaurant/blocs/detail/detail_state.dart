part of 'detail_bloc.dart';

abstract class DetailRestaurantState extends Equatable {
  const DetailRestaurantState();

  @override
  List<Object> get props => [];
}

class DetailRestaurantInitial extends DetailRestaurantState {}

class DetailRestaurantLoading extends DetailRestaurantState {}

class DetailRestaurantSuccess extends DetailRestaurantState {
  const DetailRestaurantSuccess({required this.data});

  final DetailRestaurantModel data;

  @override
  List<Object> get props => [data];
}

class DetailRestaurantFailure extends DetailRestaurantState {
  const DetailRestaurantFailure(this.failureMessage);

  final String failureMessage;

  @override
  List<Object> get props => [failureMessage];
}

class NotConnectedDetail extends DetailRestaurantState {
  const NotConnectedDetail(this.failureMessage);

  final String failureMessage;

  @override
  List<Object> get props => [failureMessage];
}
