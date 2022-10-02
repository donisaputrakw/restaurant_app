import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_app/app/app.dart';
import 'package:restaurant_app/core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();
  await notificationHelper.initNotifications(FlutterLocalNotificationsPlugin());

  runApp(const App());
}
