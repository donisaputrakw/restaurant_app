import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/restaurant/restaurant.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailRestaurantBloc
    extends Bloc<DetailRestaurantEvent, DetailRestaurantState> {
  DetailRestaurantBloc({
    required this.detailApiDataSource,
    required this.networkInfo,
  }) : super(DetailRestaurantInitial()) {
    on<FetchDetailRestaurantEvent>(_fetchDetailRestaurants);
  }

  final DetailApiDataSource detailApiDataSource;
  final NetworkInfo networkInfo;

  Future _fetchDetailRestaurants(
    FetchDetailRestaurantEvent event,
    Emitter<DetailRestaurantState> emit,
  ) async {
    try {
      emit(DetailRestaurantLoading());
      final result =
          await detailApiDataSource.fetchDetailRestaurant(id: event.id);
      log(result.toString());
      if (result.error) {
        emit(DetailRestaurantFailure(result.message));
      } else {
        emit(DetailRestaurantSuccess(data: result));
      }
    } catch (exception, stackTrace) {
      emit(
        DetailRestaurantFailure(
          '[Exception : $exception] [Stacktrace : $stackTrace]',
        ),
      );
    }
  }
}
