part of '../page.dart';

class _PopulerRestaurantSection extends StatelessWidget {
  const _PopulerRestaurantSection({required this.restaurants});
  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    final populers =
        restaurants.where((element) => element.rating >= 4.5).toList();
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(Dimens.dp16),
        separatorBuilder: (context, index) => const SizedBox(
          width: Dimens.defaultPadding,
        ),
        itemCount: populers.length,
        itemBuilder: (context, index) => CardItem(
          city: populers[index].city,
          imageUrl: 'https://restaurant-api.dicoding.dev/images/medium/${populers[index].pictureId}',
          name: populers[index].name,
          rate: populers[index].rating.toString(),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/restaurant',
              arguments: populers[index].id,
            );
          },
        ),
      ),
    );
  }
}
