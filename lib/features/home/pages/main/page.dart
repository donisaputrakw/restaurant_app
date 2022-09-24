import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/home/home.dart';

part 'sections/all_restaurant_section.dart';
part 'sections/populer_restaurant_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer<RestaurantsProvider>(
      builder: (context, state, _) {
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
                  onTap: (state.state == ResultState.hasData)
                      ? () {
                          Navigator.pushNamed(
                            context,
                            '/search',
                          );
                        }
                      : null,
                  hintText: 'Search',
                ),
              ),
            ),
          ),
          body: (state.state == ResultState.error)
              ? EmptyListIllustration(
                  desc: state.message,
                  title: 'Oops, looks like something went wrong',
                )
              : (state.state == ResultState.hasData)
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
                        _PopulerRestaurantSection(
                          restaurants: state.result.restaurants,
                        ),
                        const SizedBox(height: Dimens.dp16),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.defaultPadding,
                          ),
                          child: Text(
                            'ALL RESTAURANT',
                            style: textTheme.subtitle1,
                          ),
                        ),
                        const SizedBox(height: Dimens.dp16),
                        _AllRestaurantSection(
                          restaurants: state.result.restaurants,
                        ),
                        const SizedBox(height: Dimens.dp32),
                      ],
                    )
                  : (state.state == ResultState.noData)
                      ? const SizedBox()
                      : const ListSkeleton(),
        );
      },
    );
  }
}
