import 'package:dio/dio.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/search_tab/data/data_sources/search_interface_data_source.dart';
import 'package:rowad_hrag/features/search_tab/data/models/search_request_data_model.dart';

class SearchRemoteDataSource implements SearchInterfaceDataSource {
  final Dio _dio;

  SearchRemoteDataSource(this._dio);

  @override
  Future<Response> search(SearchRequestDataModel search) async {
    return await _dio.get(
      ApiEndPoints.search,
      queryParameters: {
        'name': search.name,
        'min': search.min,
        'max': search.max,
        'categorise': search.categorise,
        'brands': search.brands,
      },
    );
  }
}
