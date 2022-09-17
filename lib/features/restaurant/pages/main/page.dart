import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

part 'sections/heading_section.dart';
part 'sections/drinks_section.dart';
part 'sections/foods_section.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key, required this.restaurant});
  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: _HeadingSection(restaurant: restaurant),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                height: Dimens.dp500,
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: const TabBar(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimens.defaultPadding,
                      ),
                      tabs: [
                        Tab(child: Text('Foods')),
                        Tab(child: Text('Drinks')),
                      ],
                    ),
                    body: TabBarView(
                      children: <Widget>[
                        _FoodsSection(foods: restaurant.menus.foods),
                        _DricksSection(drinks: restaurant.menus.drinks),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
