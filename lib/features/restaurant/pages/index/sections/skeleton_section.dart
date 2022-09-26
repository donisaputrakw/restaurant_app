part of '../page.dart';

class _SkeletonSection extends StatelessWidget {
  const _SkeletonSection();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      children: const [
        Skeleton(height: Dimens.dp200),
        SizedBox(height: Dimens.defaultPadding),
        Skeleton(height: Dimens.dp30),
        SizedBox(height: Dimens.defaultPadding),
        Skeleton(height: Dimens.dp30),
        SizedBox(height: Dimens.defaultPadding),
        Skeleton(height: Dimens.dp200),
        SizedBox(height: Dimens.defaultPadding),
        Skeleton(height: Dimens.dp30),
        SizedBox(height: Dimens.defaultPadding),
        Skeleton(height: Dimens.dp30),
        SizedBox(height: Dimens.defaultPadding),
        Skeleton(height: Dimens.dp30),
        SizedBox(height: Dimens.defaultPadding),
        Skeleton(height: Dimens.dp30),
      ],
    );
  }
}
