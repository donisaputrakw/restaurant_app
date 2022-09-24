import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/home/home.dart';

class RestaurantsProvider extends ChangeNotifier {
  RestaurantsProvider({required this.homeApiDataSource}) {
    _fetchRestaurants();
  }

  final HomeApiDataSource homeApiDataSource;

  late RestaurantsModel _restaurantsModel;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantsModel get result => _restaurantsModel;

  ResultState get state => _state;

  Future<dynamic> _fetchRestaurants() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final result = await homeApiDataSource.fetchRestaurants();
      if (result.error) {
        _state = ResultState.error;
        _message = result.message;
        notifyListeners();
      } else {
        if (result.restaurants.isEmpty) {
          _state = ResultState.noData;
          notifyListeners();
          log(_state.toString());
          return _message = result.message;
        } else {
          _state = ResultState.hasData;
          notifyListeners();
          log(_state.toString());
          return _restaurantsModel = result;
        }
      }
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error --> $e';
      notifyListeners();
      log('$_state : $_message');
      return _message;
    }
  }
}
