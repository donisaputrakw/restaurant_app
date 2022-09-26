import 'package:flutter/material.dart';
import 'package:restaurant_app/core/components/components.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        centerTitle: true,
      ),
      body: const EmptyListIllustration(
        desc: 'we will inform you when this feature is available',
        title: 'Oops, this feature is not yet available',
      ),
    );
  }
}
