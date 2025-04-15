import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final ios = IOSInitializationSettings();
    await _flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(android: android, iOS: ios),
    );
  }

  Future<void> showNotification(String title, String body) async {
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails('main_channel', 'Main Channel'),
      ),
    );
  }
}
