import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/restaurant/restaurant.dart';
import 'package:restaurant_app/l10n/l10n.dart';

part 'sections/heading_section.dart';
part 'sections/customer_review_section.dart';
part 'sections/review_section.dart';
part 'sections/skeleton_section.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailRestaurantBloc>(
          create: (BuildContext context) => DetailRestaurantBloc(
            restaurantApiDataSource: RestaurantApiDataSourceImpl(),
            networkInfo: NetworkInfoImpl(
              connectionChecker: InternetConnectionChecker(),
            ),
          ),
        ),
        BlocProvider<ReviewBloc>(
          create: (BuildContext context) => ReviewBloc(
            restaurantApiDataSource: RestaurantApiDataSourceImpl(),
            networkInfo: NetworkInfoImpl(
              connectionChecker: InternetConnectionChecker(),
            ),
          ),
        ),
        BlocProvider<FavoriteBloc>(
          create: (BuildContext context) => FavoriteBloc(),
        ),
      ],
      child: RestaurantView(id: id),
    );
  }
}

class RestaurantView extends StatefulWidget {
  const RestaurantView({super.key, required this.id});
  final String id;

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  late bool _loadingDialogIsOpen = false;
  late bool _isFavorite = false;
  late List<String> _restaurants = [];

  @override
  void initState() {
    _fetchData();
    _nameController.addListener(() {
      setState(() {});
    });
    _descController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void _fetchData() {
    context.read<DetailRestaurantBloc>().add(
          FetchDetailRestaurantEvent(id: widget.id),
        );
    context.read<FavoriteBloc>().add(
          GetFavoriteEvent(id: widget.id),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        if (state is FavoriteSuccess) {
          setState(() {
            _isFavorite = state.isFavorite;
            _restaurants = state.restaurants;
          });
          if (state.isFavorite == true) {
            IndicatorsUtils.showSuccessSnackBar(
              context,
              context.l10n.successAdd,
            );
          } else {
            IndicatorsUtils.showSuccessSnackBar(
              context,
              context.l10n.successDelete,
            );
          }
        } else if (state is FetchSuccess) {
          setState(() {
            _isFavorite = state.isFavorite;
            _restaurants = state.restaurants;
          });
        }
      },
      child: BlocListener<ReviewBloc, ReviewState>(
        listener: (context, state) {
          if (state is ReviewLoading) {
            setState(() {
              _loadingDialogIsOpen = true;
            });
            IndicatorsUtils.showDialogLoading(context).whenComplete(() {
              setState(() {
                _loadingDialogIsOpen = false;
              });
            });
          } else if (state is ReviewSuccess) {
            _nameController.clear();
            _descController.clear();
            _dismissDialog();
            _fetchData();
          } else if (state is ReviewFailure) {
            _dismissDialog();
            IndicatorsUtils.showErrorSnackBar(
              context,
              state.failureMessage,
            );
          } else if (state is NotConnectedReview) {
            _dismissDialog();
            IndicatorsUtils.showErrorSnackBar(
              context,
              state.failureMessage,
            );
          }
        },
        child: BlocBuilder<DetailRestaurantBloc, DetailRestaurantState>(
          builder: (context, state) {
            if (state is DetailRestaurantFailure) {
              return Scaffold(
                appBar: AppBar(scrolledUnderElevation: 5),
                body: EmptyListIllustration(
                  desc: state.failureMessage,
                  title: context.l10n.titleSomethongWrong,
                ),
              );
            } else if (state is NotConnectedDetail) {
              return Scaffold(
                appBar: AppBar(scrolledUnderElevation: 5),
                body: NotConnectedIllustration(onRefresh: _fetchData),
              );
            } else if (state is DetailRestaurantSuccess) {
              return Scaffold(
                appBar: AppBar(scrolledUnderElevation: 5),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: _isFavorite == true
                      ? () {
                          context.read<FavoriteBloc>().add(
                                DeleteFavoriteEvent(
                                  restaurant: Restaurant(
                                    id: state.data.restaurant.id,
                                    name: state.data.restaurant.name,
                                    description:
                                        state.data.restaurant.description,
                                    pictureId: state.data.restaurant.pictureId,
                                    city: state.data.restaurant.city,
                                    rating: state.data.restaurant.rating,
                                  ),
                                  restaurants: _restaurants,
                                ),
                              );
                        }
                      : () {
                          context.read<FavoriteBloc>().add(
                                AddFavoriteEvent(
                                  restaurant: Restaurant(
                                    id: state.data.restaurant.id,
                                    name: state.data.restaurant.name,
                                    description:
                                        state.data.restaurant.description,
                                    pictureId: state.data.restaurant.pictureId,
                                    city: state.data.restaurant.city,
                                    rating: state.data.restaurant.rating,
                                  ),
                                ),
                              );
                        },
                  child: Icon(
                    Icons.favorite_rounded,
                    color: _isFavorite == true
                        ? AppColors.red
                        : AppColors.secondaryColor,
                    size: Dimens.dp28,
                  ),
                ),
                body: RefreshIndicator(
                  onRefresh: () async {
                    context.read<DetailRestaurantBloc>().add(
                          FetchDetailRestaurantEvent(id: widget.id),
                        );
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child:
                            _HeadingSection(restaurant: state.data.restaurant),
                      ),
                      SliverToBoxAdapter(
                        child: _CustomerReviewSection(
                          reviews: state.data.restaurant.customerReviews,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: _ReviewSection(
                          descController: _descController,
                          nameController: _nameController,
                          onPressed: (_nameController.text.isNotEmpty &&
                                  _descController.text.isNotEmpty)
                              ? () {
                                  context.read<ReviewBloc>().add(
                                        SendReview(
                                          request: ReviewRequest(
                                            id: widget.id,
                                            name: _nameController.text,
                                            review: _descController.text,
                                          ),
                                        ),
                                      );
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(scrolledUnderElevation: 5),
              body: const _SkeletonSection(),
            );
          },
        ),
      ),
    );
  }

  void _dismissDialog() {
    if (_loadingDialogIsOpen) {
      Navigator.of(context).pop();
    }

    setState(() {
      _loadingDialogIsOpen = false;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }
}
