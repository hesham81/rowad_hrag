import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/domain/repositories/home_reposatory.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/sub_categories_data_model.dart';

class GetAllSubCategoriesUseCase {
  late HomeReposatory _homeReposatory;

  GetAllSubCategoriesUseCase(this._homeReposatory);

  Future<Either<Failure, List<SubCategoriesDataModel>>> call(int id ) async {
    return await _homeReposatory.getSubCategories(id);
  }
}
