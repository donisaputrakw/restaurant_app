import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/restaurant/restaurant.dart';
import 'package:restaurant_app/l10n/l10n.dart';

part 'sections/heading_section.dart';
part 'sections/customer_review_section.dart';
part 'sections/review_section.dart';
part 'sections/skeleton_section.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.id});
  final String id;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  late bool _loadingDialogIsOpen = false;
  final NotificationHelper _notificationHelper = NotificationHelper();

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 5,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<DetailRestaurantBloc>().add(
                FetchDetailRestaurantEvent(id: widget.id),
              );
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
              if (state is DetailRestaurantSuccess) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: _HeadingSection(
                        restaurant: state.data.restaurant,
                      ),
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
                );
              } else if (state is DetailRestaurantFailure) {
                return EmptyListIllustration(
                  desc: state.failureMessage,
                  title: context.l10n.titleSomethongWrong,
                );
              } else if (state is NotConnectedDetail) {
                return NotConnectedIllustration(onRefresh: _fetchData);
              } else {
                return const _SkeletonSection();
              }
            },
          ),
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
