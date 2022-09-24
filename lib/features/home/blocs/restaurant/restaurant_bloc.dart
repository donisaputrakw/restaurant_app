import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/home/home.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc({
    required this.homeApiDataSource,
    required this.networkInfo,
  }) : super(RestaurantInitial()) {
    on<FetchRestaurantEvent>(_fetchRestaurants);
  }

  final HomeApiDataSource homeApiDataSource;
  final NetworkInfo networkInfo;

  Future _fetchRestaurants(
    FetchRestaurantEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    try {
      emit(RestaurantLoading());
      final result = await homeApiDataSource.fetchRestaurants();
      if (result.error) {
        emit(RestaurantFailure(result.message));
      } else {
        emit(RestaurantSuccess(data: result));
      }
    } catch (exception, stackTrace) {
      emit(
        RestaurantFailure(
          '[Exception : $exception] [Stacktrace : $stackTrace]',
        ),
      );
    }
  }
}
