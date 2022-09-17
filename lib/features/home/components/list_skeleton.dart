import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

class ListSkeleton extends StatelessWidget {
  const ListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        vertical: Dimens.defaultPadding,
      ),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.defaultPadding,
          ),
          child: Skeleton(
            width: Dimens.dp100,
            height: Dimens.dp30,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(Dimens.defaultPadding),
            separatorBuilder: (context, index) => const SizedBox(
              width: Dimens.defaultPadding,
            ),
            itemCount: 3,
            itemBuilder: (context, index) => const Skeleton(
              width: Dimens.dp125,
              height: 220,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.defaultPadding,
          ),
          child: Skeleton(
            width: Dimens.dp100,
            height: Dimens.dp30,
          ),
        ),
        GridView.count(
          padding: const EdgeInsets.all(Dimens.defaultPadding),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: Dimens.defaultPadding,
          mainAxisSpacing: Dimens.defaultPadding,
          crossAxisCount: 3,
          childAspectRatio: 5 / 9,
          children: [1, 2, 3, 4, 5, 6, 7, 8]
              .map(
                (e) => const Skeleton(),
              )
              .toList(),
        ),
      ],
    );
  }
}
