import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/data/data_sources/sub_categories_product_details_interface_data_source.dart';

class RemoteSubCategoriesProductsDataSource
    implements SubCategoriesProductDetailsInterfaceDataSource {
  late Dio _dio;

  RemoteSubCategoriesProductsDataSource(this._dio);

  @override
  Future<Response> getAllSubCategoriesProductDetails(String id) async {
    return await _dio.get("${ApiEndPoints.subCategoriesProducts}/$id");
  }
}
