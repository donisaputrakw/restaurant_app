import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/restaurant/restaurant.dart';

part 'sections/heading_section.dart';
part 'sections/drinks_section.dart';
part 'sections/foods_section.dart';
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

  @override
  void initState() {
    context.read<DetailRestaurantBloc>().add(
          FetchDetailRestaurantEvent(id: widget.id),
        );
    super.initState();
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
                      onPressed: () {},
                    ),
                  ),
                ],
              );
            } else if (state is DetailRestaurantFailure) {
              return EmptyListIllustration(
                desc: state.failureMessage,
                title: 'Oops, looks like something went wrong',
              );
            } else {
              return const _SkeletonSection();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }
}
