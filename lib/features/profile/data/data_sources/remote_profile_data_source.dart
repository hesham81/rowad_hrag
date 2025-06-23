import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/features/profile/data/data_sources/profile_interface_data_source.dart';

import '../../../../core/constant/api_networks.dart';

class RemoteProfileDataSource implements ProfilesInterfaceDataSource {
  final Dio _dio;

  const RemoteProfileDataSource(this._dio);

  @override
  Future<Response> getProfileData() async {
    return await _dio.get(ApiEndPoints.profile);
  }
}
