import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/domain/entities/category.dart';

import '../../../../core/failures/failure.dart';

abstract class HomeReposatory {
  Future<Either<Failure, List<Category>>> getAllCategories();
}
