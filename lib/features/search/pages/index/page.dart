import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/search/search.dart';
import 'package:restaurant_app/l10n/l10n.dart';

part 'sections/body_section.dart';
part 'sections/skeleton_section.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        searchApiDataSource: SearchApiDataSourceImpl(),
        networkInfo: NetworkInfoImpl(
          connectionChecker: InternetConnectionChecker(),
        ),
      ),
      child: const SearchView(),
    );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<SearchBloc>().add(
          SearchRestaurantEvent(query: _searchController.text),
        );
    super.initState();
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
                  hintText: context.l10n.search,
                  onChanged: (value) {
                    context.read<SearchBloc>().add(
                          SearchRestaurantEvent(query: value),
                        );
                  },
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
                      title: context.l10n.titleSomethongWrong,
                    )
                  : (state is NotConnectedSearch)
                      ? NotConnectedIllustration(
                          onRefresh: () {
                            context.read<SearchBloc>().add(
                                  SearchRestaurantEvent(
                                    query: _searchController.text,
                                  ),
                                );
                          },
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
