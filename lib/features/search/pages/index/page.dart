import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/search/search.dart';

part 'sections/body_section.dart';
part 'sections/skeleton_section.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<SearchBloc>().add(
          SearchRestaurantEvent(query: _searchController.text),
        );
    _addListener();
    super.initState();
  }

  void _addListener() {
    _searchController.addListener(
      () => context.read<SearchBloc>().add(
            SearchRestaurantEvent(query: _searchController.text),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
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
                ),
              ),
            ),
          ),
          body: (state is SearchSuccess)
              ? _BodySection(
                  restaurants: state.data.restaurants,
                  searchController: _searchController,
                )
              : (state is SearchFailure)
                  ? EmptyListIllustration(
                      desc: state.failureMessage,
                      title: 'Oops, looks like something went wrong',
                    )
                  : const _SkeletonSection(),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
