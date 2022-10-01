part of 'review_bloc.dart';

abstract class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewSuccess extends ReviewState {}

class ReviewFailure extends ReviewState {
  const ReviewFailure(this.failureMessage);

  final String failureMessage;

  @override
  List<Object> get props => [failureMessage];
}

class NotConnectedReview extends ReviewState {
  const NotConnectedReview(this.failureMessage);

  final String failureMessage;

  @override
  List<Object> get props => [failureMessage];
}
