import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/features/product_details/data/data_sources/product_interface_data_source.dart';

import '../../../../core/constant/api_networks.dart';

class RemoteProductDataSource implements ProductInterfaceDataSource {
  final Dio _dio;

  RemoteProductDataSource(this._dio);

  @override
  Future<Response> getProductDetails(String id) async {
    return await _dio.get("${ApiEndPoints.productDetails}/$id");
  }

  @override
  Future<Response> getCities(int id) async {
    return await _dio.get("${ApiEndPoints.cityByStateId}/$id");
  }

  @override
  Future<Response> getState() async {
    return await _dio.get(ApiEndPoints.states);
  }
}
