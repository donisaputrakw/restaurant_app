import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/core.dart';

part 'favorite_restaurants_event.dart';
part 'favorite_restaurants_state.dart';

class FavoriteRestaurantsBloc
    extends Bloc<FavoriteRestaurantsEvent, FavoriteRestaurantsState> {
  FavoriteRestaurantsBloc() : super(FavoriteRestaurantsInitial()) {
    on<GetFavoritesEvent>(_getFavorites);
    on<DeleteFavoriteRestaurantEvent>(_deleteFavorites);
  }

  Future _getFavorites(
    GetFavoritesEvent event,
    Emitter<FavoriteRestaurantsState> emit,
  ) async {
    try {
      emit(FavoriteRestaurantsLoading());
      final cache = await CacheManager.loadListString('restaurants');
      emit(FavoriteRestaurantsSuccess(cache));
    } catch (exception, stackTrace) {
      emit(
        FavoriteRestaurantsFailure(
          '[Exception : $exception] [Stacktrace : $stackTrace]',
        ),
      );
    }
  }

  Future _deleteFavorites(
    DeleteFavoriteRestaurantEvent event,
    Emitter<FavoriteRestaurantsState> emit,
  ) async {
    try {
      emit(FavoriteRestaurantsLoading());
      final restaurants = event.restaurants;
      restaurants.remove(jsonEncode(event.restaurant));
      final result = await CacheManager.writeList('restaurants', restaurants);
      if (result) {
        emit(SuccessDeleteFavoriteRestaurant(restaurants));
        emit(FavoriteRestaurantsSuccess(restaurants));
      } else {
        emit(const FavoriteRestaurantsFailure('Terjadi kesalahan!'));
      }
    } catch (exception, stackTrace) {
      emit(
        FavoriteRestaurantsFailure(
          '[Exception : $exception] [Stacktrace : $stackTrace]',
        ),
      );
    }
  }
}
