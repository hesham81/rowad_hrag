import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/domain/repositories/home_reposatory.dart';

import '../../../../core/failures/failure.dart';
import '../entities/category.dart';

class GetAllCategoriesUseCase {
  HomeReposatory _homeReposatory;

  GetAllCategoriesUseCase(this._homeReposatory);

  Future<Either<Failure, List<Category>>>call() async {
    return await _homeReposatory.getAllCategories();
  }
}
