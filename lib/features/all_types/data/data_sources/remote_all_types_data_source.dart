import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/all_types/data/data_sources/all_types_interface_data_source.dart';

class RemoteAllTypesDataSource implements AllTypesInterfaceDataSource {
  late Dio _dio;

  RemoteAllTypesDataSource(this._dio);

  @override
  Future<Response> getAllTypes() async {
    return await _dio.get(ApiEndPoints.allCategories);
  }
}
