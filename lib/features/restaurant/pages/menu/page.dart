import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key, required this.menus});
  final MenusModel menus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: DefaultT,
      ),
    );
  }
}
