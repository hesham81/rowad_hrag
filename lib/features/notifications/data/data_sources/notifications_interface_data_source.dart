import 'package:dio/dio.dart';

abstract class NotificationsInterfaceDataSource {
  Future<Response> getAllNotifications();
}
