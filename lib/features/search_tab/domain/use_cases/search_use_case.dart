import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../layout/data/models/products_data_model.dart';
import '../../data/models/search_request_data_model.dart';
import '../repositories/search_repo.dart';

class SearchUseCase {
  final SearchReposatory _reposatory;

  SearchUseCase(this._reposatory);

  Future<Either<Failure, List<ProductsDataModel>>> call(
    SearchRequestDataModel search,
  ) async {
    return await _reposatory.search(search);
  }
}
