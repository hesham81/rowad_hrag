// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// abstract class LocalNotificationService {
//   final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   Future<void> init() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );
//
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//
//     // Initialize plugin
//     await _notificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
//     );
//
//     // Create notification channel for Android
//     await _createNotificationChannel();
//   }
//
//   Future<void> _createNotificationChannel() async {
//     final platform = _notificationsPlugin.resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>();
//
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'notification_channel_id',
//       'رواد حراج إشعارات',
//       description: 'إشعارات التطبيق',
//       importance: Importance.high,
//       playSound: true,
//       enableVibration: true,
//     );
//
//     await platform?.createNotificationChannel(channel);
//   }
//
//   void _onDidReceiveNotificationResponse(NotificationResponse response) {
//     // Handle notification tap
//   }
// }
