import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/restaurant/restaurant.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc({
    required this.restaurantApiDataSource,
    required this.networkInfo,
  }) : super(ReviewInitial()) {
    on<SendReview>(_sendReview);
  }

  final RestaurantApiDataSource restaurantApiDataSource;
  final NetworkInfo networkInfo;

  Future _sendReview(
    SendReview event,
    Emitter<ReviewState> emit,
  ) async {
    try {
      emit(ReviewLoading());
      final result = await restaurantApiDataSource.sendReview(
        request: event.request,
      );
      if (result.error) {
        emit(ReviewFailure(result.message));
      } else {
        emit(ReviewSuccess());
      }
    } catch (exception, stackTrace) {
      emit(
        ReviewFailure(
          '[Exception : $exception] [Stacktrace : $stackTrace]',
        ),
      );
    }
  }
}
