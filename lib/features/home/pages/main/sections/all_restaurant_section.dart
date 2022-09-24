part of '../page.dart';

class _AllRestaurantSection extends StatelessWidget {
  const _AllRestaurantSection({required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    restaurants.sort((a, b) => a.id.compareTo(b.id));
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.defaultPadding),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: Dimens.defaultPadding,
      mainAxisSpacing: Dimens.defaultPadding,
      crossAxisCount: 3,
      childAspectRatio: 5 / 9,
      children: restaurants
          .map(
            (e) => CardItem(
              city: e.city,
              imageUrl: 'https://restaurant-api.dicoding.dev/images/medium/${e.pictureId}',
              name: e.name,
              rate: e.rating.toString(),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/restaurant',
                  arguments: e,
                );
              },
            ),
          )
          .toList(),
    );
  }
}
