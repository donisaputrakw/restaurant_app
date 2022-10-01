part of '../page.dart';

class _BodySection extends StatelessWidget {
  const _BodySection({
    required this.restaurants,
    required this.searchController,
  });
  final List<Restaurant> restaurants;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return (searchController.text.isEmpty)
        ? EmptyListIllustration(
            desc: context.l10n.descFindRestaurant,
            title: context.l10n.titleFindRestaurant,
          )
        : ((restaurants.isNotEmpty)
            ? ListView(
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
                        title: Text(e.name),
                        subtitle: Text(e.city),
                        trailing: Text(
                          e.rating.toString(),
                          style: textTheme.subtitle2?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/restaurant',
                            arguments: e.id,
                          );
                        },
                      ),
                    )
                    .toList(),
              )
            : EmptyListIllustration(
                desc: context.l10n.descNotFoundRestaurant,
                title: context.l10n.titleNotFoundRestaurant,
              ));
  }
}
