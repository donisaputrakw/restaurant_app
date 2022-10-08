part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class StartedNotificationEvent extends NotificationEvent {}

class ActivateNotificationEvent extends NotificationEvent {
  const ActivateNotificationEvent(this.isActivate);

  final bool isActivate;

  @override
  List<Object> get props => [isActivate];
}
