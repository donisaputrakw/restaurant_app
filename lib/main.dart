import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_app/app/app.dart';
import 'package:restaurant_app/core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final BackgroundService service = BackgroundService();
  service.initializeIsolate();
  AndroidAlarmManager.initialize();

  final NotificationHelper notificationHelper = NotificationHelper();
  await notificationHelper.initNotifications(FlutterLocalNotificationsPlugin());

  runApp(const App());
}
