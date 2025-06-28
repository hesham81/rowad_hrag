import 'package:dio/dio.dart';

abstract class ProductInterfaceDataSource {
  Future<Response> getProductDetails(String id);

  Future<Response> getState(int id);

  Future<Response> getCity(int id);



}
