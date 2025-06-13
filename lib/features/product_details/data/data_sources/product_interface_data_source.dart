import 'package:dio/dio.dart';

abstract class ProductInterfaceDataSource {
  Future<Response> getProductDetails(String id);
}
