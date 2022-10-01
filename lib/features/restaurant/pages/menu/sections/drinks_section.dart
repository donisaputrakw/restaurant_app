part of '../page.dart';

class _DrinksSection extends StatelessWidget {
  const _DrinksSection({
    required this.drinks,
  });
  final List<DrinksModel> drinks;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: drinks
          .map((e) => ListTile(
                leading: const Icon(Icons.emoji_food_beverage_rounded),
                title: Text(
                  e.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ))
          .toList(),
    );
  }
}
