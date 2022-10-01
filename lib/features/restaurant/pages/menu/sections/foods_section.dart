part of '../page.dart';

class _FoodsSection extends StatelessWidget {
  const _FoodsSection({
    required this.foods,
  });
  final List<FoodsModel> foods;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: foods
          .map((e) => ListTile(
                leading: const Icon(Icons.fastfood_rounded),
                title: Text(
                  e.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ))
          .toList(),
    );
  }
}
