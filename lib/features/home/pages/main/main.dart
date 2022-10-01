import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/favorite/favorite.dart';
import 'package:restaurant_app/features/home/home.dart';
import 'package:restaurant_app/features/settings/settings.dart';
import 'package:restaurant_app/l10n/l10n.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _index = 0;

  final List<Widget> _pages = const [
    HomePage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryColor,
        backgroundColor: Colors.white,
        currentIndex: _index,
        onTap: (v) {
          setState(() {
            _index = v;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: context.l10n.home,
            icon: const Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: context.l10n.favorite,
            icon: const Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: context.l10n.profile,
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
