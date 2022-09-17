import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/home/components/components.dart';

part 'sections/all_restaurant_section.dart';

part 'sections/populer_restaurant_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return FutureBuilder<String>(
      future:
          DefaultAssetBundle.of(context).loadString(MainAssets.localRestaurant),
      builder: (context, snapshot) {
        final List<RestaurantModel> restaurants =
            parseRestaurants(snapshot.data);
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 5,
            toolbarHeight: 80,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Dimens.defaultPadding),
                child: SearchTextInput(
                  controller: TextEditingController(),
                  readOnly: true,
                  onTap: () {
                    Navigator.pushNamed(context, '/search',
                        arguments: restaurants);
                  },
                  hintText: 'Search',
                ),
              ),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(
              vertical: Dimens.defaultPadding,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.defaultPadding,
                ),
                child: Text('POPULAR', style: textTheme.subtitle1),
              ),
              _PopulerRestaurantSection(restaurants: restaurants),
              const SizedBox(height: Dimens.dp16),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.defaultPadding,
                ),
                child: Text('ALL RESTAURANT', style: textTheme.subtitle1),
              ),
              const SizedBox(height: Dimens.dp16),
              _AllRestaurantSection(restaurants: restaurants),
              const SizedBox(height: Dimens.dp32),
            ],
          ),
        );
      },
    );
  }
}
