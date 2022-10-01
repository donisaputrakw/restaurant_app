import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

part 'sections/drinks_section.dart';
part 'sections/foods_section.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key, required this.menus});
  final MenusModel menus;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Text(
                'Foods',
                style: Theme.of(context).textTheme.subtitle1,
              )),
              Tab(
                  child: Text(
                'Drinks',
                style: Theme.of(context).textTheme.subtitle1,
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _FoodsSection(foods: menus.foods),
            _DrinksSection(drinks: menus.drinks),
          ],
        ),
      ),
    );
  }
}
