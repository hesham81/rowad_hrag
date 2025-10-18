
import 'package:dio/dio.dart';
import 'package:rowad_hrag/features/search_tab/data/models/search_request_data_model.dart';

abstract class SearchInterfaceDataSource {
  Future<Response> search(SearchRequestDataModel search);
}
