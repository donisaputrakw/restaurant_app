part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  const NotificationSuccess(this.isActivate);

  final bool isActivate;

  @override
  List<Object> get props => [isActivate];
}

class NotificationFailure extends NotificationState {
  const NotificationFailure(this.failureMessage);

  final String failureMessage;

  @override
  List<Object> get props => [failureMessage];
}
