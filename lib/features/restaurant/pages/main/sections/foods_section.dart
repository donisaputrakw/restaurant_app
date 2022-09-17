part of '../page.dart';

class _FoodsSection extends StatelessWidget {
  const _FoodsSection({required this.foods});
  final List<FoodsModel> foods;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      children: foods
          .map(
            (e) => Card(
              child: Padding(
                padding: const EdgeInsets.all(Dimens.defaultPadding),
                child: Text(
                  e.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
