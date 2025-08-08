import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/features/product_details/data/data_sources/product_interface_data_source.dart';
import 'package:rowad_hrag/features/product_details/data/models/message_request_data_model.dart';
import 'package:rowad_hrag/features/product_details/data/models/pay_to_product_request_data_model.dart';

import '../../../../core/constant/api_networks.dart';

class RemoteProductDataSource implements ProductInterfaceDataSource {
  final Dio _dio;

  RemoteProductDataSource(this._dio);

  @override
  Future<Response> getProductDetails(String id) async {
    return await _dio.get("${ApiEndPoints.productDetails}/$id");
  }

  @override
  Future<Response> getState(int id) async {
    return await _dio.get(ApiEndPoints.states);
  }

  @override
  Future<Response> getCity(int id) async {
    return await _dio.get("${ApiEndPoints.cityByStateId}/$id");
  }

  @override
  Future<Response> pay(PayToProductRequestDataModel payment) async {
    return await _dio.post(
      ApiEndPoints.customPayment,
      data: payment.toJson(),
    );
  }

  @override
  Future<Response> sendMessage(MessageRequestDataModel message) async {
    return await _dio.post(
      ApiEndPoints.conversion,
      data: message.toJson(),
    );
  }
}
