import 'package:dio/dio.dart';
import 'package:rowad_hrag/features/product_details/data/models/pay_to_product_request_data_model.dart';

abstract class ProductInterfaceDataSource {
  Future<Response> getProductDetails(String id);

  Future<Response> getState(int id);

  Future<Response> getCity(int id);

  Future<Response> pay(PayToProductRequestDataModel payment);




}
