import 'package:flutter/material.dart';
import 'package:restaurant_app/core/core.dart';

part 'sections/body_section.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.restaurants});
  final List<RestaurantModel> restaurants;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 5,
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.defaultPadding),
            child: SearchTextInput(
              controller: _searchController,
              hintText: 'Search',
              onChanged: (value) => setState(() {}),
            ),
          ),
        ),
      ),
      body: _BodySection(
        restaurants: widget.restaurants
            .where((element) => element.name.contains(_searchController.text))
            .toList(),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
