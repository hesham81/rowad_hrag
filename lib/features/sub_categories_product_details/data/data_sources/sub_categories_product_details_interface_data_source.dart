import 'package:dio/dio.dart';

abstract class SubCategoriesProductDetailsInterfaceDataSource {
  Future<Response> getAllSubCategoriesProductDetails(String id);
}