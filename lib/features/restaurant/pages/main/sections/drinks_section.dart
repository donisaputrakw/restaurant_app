part of '../page.dart';

class _DricksSection extends StatelessWidget {
  const _DricksSection({required this.drinks});
  final List<DrinksModel> drinks;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      children: drinks
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
