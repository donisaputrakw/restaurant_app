part of 'review_bloc.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

class SendReview extends ReviewEvent {
  const SendReview({required this.request});

  final ReviewRequest request;

  @override
  List<Object> get props => [request];
}
