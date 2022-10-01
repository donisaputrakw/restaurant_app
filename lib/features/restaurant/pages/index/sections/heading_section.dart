part of '../page.dart';

class _HeadingSection extends StatelessWidget {
  const _HeadingSection({required this.restaurant});
  final RestaurantX restaurant;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SmartNetworkImage(
          'https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}',
          height: Dimens.dp175,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(Dimens.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(restaurant.name, style: textTheme.headline3),
              Text(restaurant.city, style: textTheme.subtitle2),
              Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.blue,
                  ),
                  Text(
                    '${restaurant.rating}',
                    style: textTheme.subtitle2,
                  ),
                ],
              ),
              const SizedBox(height: Dimens.defaultPadding),
              Text(restaurant.description, style: textTheme.bodyLarge),
              const SizedBox(height: Dimens.defaultPadding),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuPage(
                        menus: restaurant.menus,
                      ),
                    ),
                  );
                },
                child: Text(
                  context.l10n.menu.toUpperCase(),
                  style: textTheme.subtitle2?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
