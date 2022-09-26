part of '../page.dart';

class _SkeletonSection extends StatelessWidget {
  const _SkeletonSection();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      children: [1, 2, 3, 4, 5, 6, 7, 8, 9]
          .map(
            (e) => const Padding(
              padding: EdgeInsets.only(bottom: Dimens.dp8),
              child: Skeleton(height: Dimens.dp75),
            ),
          )
          .toList(),
    );
  }
}
