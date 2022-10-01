import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/restaurant/restaurant.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailRestaurantBloc
    extends Bloc<DetailRestaurantEvent, DetailRestaurantState> {
  DetailRestaurantBloc({
    required this.restaurantApiDataSource,
    required this.networkInfo,
  }) : super(DetailRestaurantInitial()) {
    on<FetchDetailRestaurantEvent>(_fetchDetailRestaurants);
  }

  final RestaurantApiDataSource restaurantApiDataSource;
  final NetworkInfo networkInfo;

  Future _fetchDetailRestaurants(
    FetchDetailRestaurantEvent event,
    Emitter<DetailRestaurantState> emit,
  ) async {
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected) {
        emit(DetailRestaurantLoading());
        final result =
            await restaurantApiDataSource.fetchDetailRestaurant(id: event.id);
        if (result.error) {
          emit(DetailRestaurantFailure(result.message));
        } else {
          emit(DetailRestaurantSuccess(data: result));
        }
      } else {
        emit(const NotConnectedDetail(
            'silahkan periksa konesi internet kamu terlebih dahulu, jika sudah silahkan coba kembali'));
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
