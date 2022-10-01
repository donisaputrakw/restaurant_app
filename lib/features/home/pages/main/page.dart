import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/home/home.dart';

part 'sections/all_restaurant_section.dart';
part 'sections/populer_restaurant_section.dart';
part 'sections/skeleton_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is NotConnectedHome) {
          return NotConnectedIllustration(
            onRefresh: () {
              context.read<RestaurantBloc>().add(FetchRestaurantEvent());
            },
          );
        } else {
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
                    onTap: (state is RestaurantSuccess)
                        ? () {
                            Navigator.pushNamed(context, '/search');
                          }
                        : null,
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<RestaurantBloc>().add(FetchRestaurantEvent());
              },
              child: (state is RestaurantFailure)
                  ? EmptyListIllustration(
                      desc: state.failureMessage,
                      title: 'Oops, looks like something went wrong',
                    )
                  : (state is RestaurantSuccess)
                      ? ListView(
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimens.defaultPadding,
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.defaultPadding,
                              ),
                              child: Text('RESTORAN POPULER',
                                  style: textTheme.subtitle1),
                            ),
                            _PopulerRestaurantSection(
                              restaurants: state.data.restaurants,
                            ),
                            const SizedBox(height: Dimens.dp16),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.defaultPadding,
                              ),
                              child: Text(
                                'SEMUA RESTORAN',
                                style: textTheme.subtitle1,
                              ),
                            ),
                            const SizedBox(height: Dimens.dp16),
                            _AllRestaurantSection(
                              restaurants: state.data.restaurants,
                            ),
                            const SizedBox(height: Dimens.dp32),
                          ],
                        )
                      : const _SkeletonSection(),
            ),
          );
        }
      },
    );
  }
}
