part of '../page.dart';

class _SuccessSection extends StatelessWidget {
  const _SuccessSection({
    required this.restaurants,
    required this.restaurantCache,
  });
  final List<Restaurant> restaurants;
  final List<String> restaurantCache;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: Dimens.dp8),
      children: restaurants
          .map(
            (e) => ListTile(
              leading: SmartNetworkImage(
                'https://restaurant-api.dicoding.dev/images/medium/${e.pictureId}',
                width: Dimens.dp75,
                height: Dimens.dp50,
                fit: BoxFit.cover,
                radius: BorderRadius.circular(Dimens.dp8),
              ),
              title: Text(
                e.name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: Row(
                children: [
                  Text(
                    e.city,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(width: Dimens.dp8),
                  const Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.blue,
                    size: Dimens.dp18,
                  ),
                  Text(
                    '${e.rating}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              trailing: IconButton(
                  onPressed: () {
                    context.read<FavoriteRestaurantsBloc>().add(
                          DeleteFavoriteRestaurantEvent(
                            restaurant: e,
                            restaurants: restaurantCache,
                          ),
                        );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  )),
              onTap: () {
                Navigator.pushNamed(context, '/restaurant', arguments: e.id);
              },
            ),
          )
          .toList(),
    );
  }
}
