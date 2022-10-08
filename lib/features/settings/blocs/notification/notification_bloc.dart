import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/cache/cache.dart';
import 'package:restaurant_app/core/core.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<ActivateNotificationEvent>(_activateNotification);
    on<StartedNotificationEvent>(_startedNotification);
  }

  Future _startedNotification(
    StartedNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      emit(NotificationLoading());
      final cache = await CacheManager.loadBool('notification');
      emit(NotificationSuccess(cache));
    } catch (exception, stackTrace) {
      emit(
        NotificationFailure(
          '[Exception : $exception] [Stacktrace : $stackTrace]',
        ),
      );
    }
  }

  Future _activateNotification(
    ActivateNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      emit(NotificationLoading());
      await CacheManager.writeBool('notification', event.isActivate);
      if (event.isActivate == true) {
        await AndroidAlarmManager.periodic(
          const Duration(hours: 24),
          1,
          BackgroundService.callback,
          startAt: DateTimeHelper.format(),
          exact: true,
          wakeup: true,
        );
        emit(NotificationSuccess(event.isActivate));
      } else {
        await AndroidAlarmManager.cancel(1);
        emit(NotificationSuccess(event.isActivate));
      }
    } catch (exception, stackTrace) {
      emit(
        NotificationFailure(
          '[Exception : $exception] [Stacktrace : $stackTrace]',
        ),
      );
    }
  }
}
