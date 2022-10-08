import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/core.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<GetFavoriteEvent>(_getFavorites);
    on<AddFavoriteEvent>(_addFavorites);
    on<DeleteFavoriteEvent>(_deleteFavorites);
  }

  Future _getFavorites(
    GetFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      emit(FavoriteLoading());
      final cache = await CacheManager.loadListString('restaurants');
      final restaurants =
          cache.map((e) => Restaurant.fromJson(jsonDecode(e))).toList();
      final restaurant = restaurants
          .where((element) => element.id.contains(event.id))
          .toList();
      if (restaurant.isNotEmpty) {
        emit(FetchSuccess(
          isFavorite: true,
          restaurants: cache,
        ));
      } else {
        emit(FetchSuccess(
          isFavorite: false,
          restaurants: cache,
        ));
      }
    } catch (exception, stackTrace) {
      emit(
        FavoriteFailure(
          '[Exception : $exception] [Stacktrace : $stackTrace]',
        ),
      );
    }
  }

  Future _addFavorites(
    AddFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      emit(FavoriteLoading());
      // await CacheManager.clear('restaurants');
      final cache = await CacheManager.loadListString('restaurants');
      cache.add(jsonEncode(event.restaurant));
      final result = await CacheManager.writeList('restaurants', cache);
      if (result) {
        emit(FavoriteSuccess(
          isFavorite: true,
          restaurants: cache,
        ));
      } else {
        emit(const FavoriteFailure('Terjadi kesalahan!'));
      }
    } catch (exception, stackTrace) {
      emit(
        FavoriteFailure(
          '[Exception : $exception] [Stacktrace : $stackTrace]',
        ),
      );
    }
  }

  Future _deleteFavorites(
    DeleteFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      emit(FavoriteLoading());
      final restaurants = event.restaurants;
      restaurants.remove(jsonEncode(event.restaurant));
      final result = await CacheManager.writeList('restaurants', restaurants);
      if (result) {
        emit(FavoriteSuccess(
          isFavorite: false,
          restaurants: restaurants,
        ));
      } else {
        emit(const FavoriteFailure('Terjadi kesalahan!'));
      }
    } catch (exception, stackTrace) {
      emit(
        FavoriteFailure(
          '[Exception : $exception] [Stacktrace : $stackTrace]',
        ),
      );
    }
  }
}
