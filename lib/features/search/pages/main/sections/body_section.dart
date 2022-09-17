part of '../page.dart';

class _BodySection extends StatelessWidget {
  const _BodySection({required this.restaurants});
  final List<RestaurantModel> restaurants;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return (restaurants.isNotEmpty)
        ? ListView(
            padding: const EdgeInsets.symmetric(vertical: Dimens.dp8),
            children: restaurants
                .map(
                  (e) => ListTile(
                    leading: Hero(
                      tag: 'search${e.pictureId}',
                      child: SmartNetworkImage(
                        e.pictureId,
                        width: Dimens.dp75,
                        height: Dimens.dp50,
                        fit: BoxFit.cover,
                        radius: BorderRadius.circular(Dimens.dp8),
                      ),
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
                      Navigator.pushNamed(context, '/restaurant', arguments: {
                        'restaurant': e,
                        'tag': 'search${e.id}',
                      });
                    },
                  ),
                )
                .toList(),
          )
        : const EmptyListIllustration(
            desc: 'please check your spelling again or use another keyword',
            title: 'Oops, restaurant was not found',
          );
  }
}
