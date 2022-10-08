part of '../page.dart';

class _EmprtySection extends StatelessWidget {
  const _EmprtySection({
    required this.desc,
    required this.title,
  });
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.dp40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              MainAssets.illSearchEmpty,
              width: Dimens.dp150,
            ),
            const SizedBox(height: Dimens.defaultPadding),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            Text(
              desc,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
