import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/notifications/data/data_sources/notifications_interface_data_source.dart';

class RemoteNotificationsDataSource
    implements NotificationsInterfaceDataSource {
  late Dio _dio;

  RemoteNotificationsDataSource(this._dio);

  @override
  Future<Response> getAllNotifications() async {
    return await _dio.get(ApiEndPoints.getAllNotifications);
  }
}
