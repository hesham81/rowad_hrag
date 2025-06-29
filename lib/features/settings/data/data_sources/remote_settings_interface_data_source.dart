import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/settings/data/data_sources/home_settings_interface_data_source.dart';

class RemoteSettingsInterfaceDataSource
    implements HomeSettingsInterfaceDataSource {

  final Dio _dio;

  const RemoteSettingsInterfaceDataSource(this._dio);

  @override
  Future<Response> getHomeSettings() async {
    return await _dio.get(
      ApiEndPoints.getHomeSettings,
    );
  }
}
