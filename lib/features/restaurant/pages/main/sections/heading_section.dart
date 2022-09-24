part of '../page.dart';

class _HeadingSection extends StatelessWidget {
  const _HeadingSection({required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SmartNetworkImage(
          restaurant.pictureId,
          height: Dimens.dp175,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(Dimens.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
        ),
      ],
    );
  }
}
