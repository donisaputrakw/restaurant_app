import 'package:flutter/material.dart';
import 'package:restaurant_app/features/auth/auth.dart';
import 'package:restaurant_app/features/home/home.dart';
import 'package:restaurant_app/features/restaurant/restaurant.dart';
import 'package:restaurant_app/features/search/search.dart';
import 'package:restaurant_app/features/settings/settings.dart';

class AppRouter {
  const AppRouter._();

  static Map<String, WidgetBuilder> get routes => {
        '/': (context) => const SplashPage(),
        '/auth': (context) => const AuthPage(),
        '/register': (context) => const RegisterPage(),
        '/main': (context) => const MainPage(),
        '/search': (context) => const SearchPage(),
        '/restaurant': (context) => RestaurantPage(
              id: ModalRoute.of(context)?.settings.arguments as String,
            ),
      };
}
