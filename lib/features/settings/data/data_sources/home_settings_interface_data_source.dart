import 'package:dio/dio.dart';

abstract class HomeSettingsInterfaceDataSource {
  Future<Response> getHomeSettings();

  Future<Response> updateSettings();
}
