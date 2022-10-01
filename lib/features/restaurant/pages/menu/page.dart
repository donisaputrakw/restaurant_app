import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/l10n/l10n.dart';

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
                  context.l10n.foods,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Tab(
                child: Text(
                  context.l10n.drinks,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
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
