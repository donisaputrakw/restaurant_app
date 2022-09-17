import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/home/components/components.dart';

part 'sections/all_restaurant_section.dart';
part 'sections/populer_restaurant_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<RestaurantModel>? _restaurants = [];

  @override
  void initState() {
    _loadCountryData();
    super.initState();
  }

  Future<void> _loadCountryData() async {
    try {
      final data = await DefaultAssetBundle.of(context)
          .loadString(MainAssets.localRestaurant);
      setState(() {
        _restaurants = parseRestaurants(data);
      });
    } catch (e) {
      log(e.toString());
      setState(() {
        _restaurants = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
              onTap: (_restaurants == null)
                  ? null
                  : (_restaurants!.isNotEmpty)
                      ? () {
                          Navigator.pushNamed(
                            context,
                            '/search',
                            arguments: _restaurants,
                          );
                        }
                      : null,
              hintText: 'Search',
            ),
          ),
        ),
      ),
      body: (_restaurants == null)
          ? const EmptyListIllustration(
              desc: 'check and make sure the data is available again.',
              title: 'Oops, looks like something went wrong',
            )
          : (_restaurants!.isNotEmpty)
              ? ListView(
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
                    _PopulerRestaurantSection(restaurants: _restaurants ?? []),
                    const SizedBox(height: Dimens.dp16),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.defaultPadding,
                      ),
                      child: Text('ALL RESTAURANT', style: textTheme.subtitle1),
                    ),
                    const SizedBox(height: Dimens.dp16),
                    _AllRestaurantSection(restaurants: _restaurants ?? []),
                    const SizedBox(height: Dimens.dp32),
                  ],
                )
              : const ListSkeleton(),
    );
  }
}
