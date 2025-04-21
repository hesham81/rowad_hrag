import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/layout/data/data_sources/home_interface_data_source.dart';

class RemoteHomeDataSource implements HomeInterfaceDataSource {
  Dio _dio;

  RemoteHomeDataSource(this._dio);

  @override
  Future<Response> getCategories() async {
    return await _dio.get(ApiEndPoints.categories);
  }

  @override
  Future<Response> getStates() {
    throw UnimplementedError();
  }
}
