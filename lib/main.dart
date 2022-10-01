import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_app/app/app.dart';
import 'package:restaurant_app/core/core.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final NotificationHelper notificationHelper = NotificationHelper();
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  notificationHelper.requestIOSPermissions(flutterLocalNotificationsPlugin);

  runApp(const App());
}
