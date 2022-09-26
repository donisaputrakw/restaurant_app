part of 'detail_bloc.dart';

abstract class DetailRestaurantEvent extends Equatable {
  const DetailRestaurantEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailRestaurantEvent extends DetailRestaurantEvent {
  const FetchDetailRestaurantEvent({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
