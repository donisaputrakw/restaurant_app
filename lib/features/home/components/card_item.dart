import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.city,
    required this.imageUrl,
    required this.name,
    required this.rate,
    this.onTap,
  });
  final String name;
  final String imageUrl;
  final String rate;
  final String city;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Dimens.dp125,
        padding: const EdgeInsets.all(Dimens.dp6),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(.5),
                blurRadius: 3,
                offset: const Offset(1, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(Dimens.dp16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmartNetworkImage(
              imageUrl,
              radius: BorderRadius.circular(Dimens.dp16),
              height: Dimens.dp100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: Dimens.dp6),
            Text(
              name,
              style: textTheme.subtitle2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(city, style: textTheme.bodyMedium),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.star_rate_rounded, color: AppColors.blue),
                Text(rate, style: textTheme.subtitle2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
