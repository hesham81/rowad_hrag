import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/all_types/data/models/all_types_data_model.dart';

abstract class AllTypesRepositories {
  Future<Either<Failure, List<AllTypesDataModel>>> getAllCategories();
}
