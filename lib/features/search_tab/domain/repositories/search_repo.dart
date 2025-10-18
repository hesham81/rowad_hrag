import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';

import '../../data/models/search_request_data_model.dart';

abstract class SearchReposatory {
  Future<Either<Failure, List<ProductsDataModel>>> search(SearchRequestDataModel search);
}
