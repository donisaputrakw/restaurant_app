import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/favorite/favorite.dart';
import 'package:restaurant_app/l10n/l10n.dart';

part 'sections/skeleton_section.dart';
part 'sections/success_section.dart';
part 'sections/empty_section.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteRestaurantsBloc(),
      child: const FavoriteView(),
    );
  }
}

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    context.read<FavoriteRestaurantsBloc>().add(GetFavoritesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<FavoriteRestaurantsBloc, FavoriteRestaurantsState>(
        listener: (context, state) {
          if (state is SuccessDeleteFavoriteRestaurant) {
            IndicatorsUtils.showSuccessSnackBar(
              context,
              context.l10n.successDelete,
            );
          }
        },
        builder: (context, state) {
          if (state is FavoriteRestaurantsSuccess) {
            if (state.restaurants.isNotEmpty) {
              return _SuccessSection(
                restaurantCache: state.restaurants,
                restaurants: state.restaurants
                    .map((e) => Restaurant.fromJson(jsonDecode(e)))
                    .toList(),
              );
            } else {
              return _EmprtySection(
                desc: context.l10n.titleEmptyList,
                title: context.l10n.descEmptyList,
              );
            }
          } else if (state is FavoriteRestaurantsFailure) {
            return EmptyListIllustration(
              desc: context.l10n.titleSomethongWrong,
              title: state.errorMessage,
            );
          }
          return const _SkeletonSection();
        },
      ),
    );
  }
}
