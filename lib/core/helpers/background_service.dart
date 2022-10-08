import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_app/core/core.dart';
import 'package:restaurant_app/features/home/home.dart';

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  final ReceivePort port = ReceivePort();

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    final HomeApiDataSource homeApiDataSource = HomeApiDataSourceImpl();
    final NotificationHelper notificationHelper = NotificationHelper();
    log('Alarm fired!');
    final result = await homeApiDataSource.fetchRestaurants();
    final list = result.restaurants;
    list.shuffle();
    await notificationHelper.showNotification(
      FlutterLocalNotificationsPlugin(),
      title: list.first.name,
      body: 'Recomendation restaurant in ${list.first.city}',
    );

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }

  Future<void> someTask() async {
    log('Updated data from the background isolate');
  }
}
