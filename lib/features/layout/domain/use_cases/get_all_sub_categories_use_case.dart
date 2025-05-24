import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/data/models/sub_categories_data_model.dart';

import '../../../../core/failures/failure.dart';
import '../repositories/home_reposatory.dart';

class GetAllSubCategoriesUseCase {
  final HomeReposatory homeReposatory;
  GetAllSubCategoriesUseCase(this.homeReposatory);
  Future<Either<Failure, List<SubCategoriesDataModel>>> call(int id ) async {
    return await homeReposatory.getSubCategories(id);
  }
}