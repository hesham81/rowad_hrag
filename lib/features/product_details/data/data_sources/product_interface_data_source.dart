import 'package:dio/dio.dart';

abstract class ProductInterfaceDataSource {
  Future<Response> getProductDetails(String id);

  Future<Response> getCities(int id );

  Future<Response> getState();
}
