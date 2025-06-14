import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/all_types/data/models/all_types_data_model.dart';
import 'package:rowad_hrag/features/all_types/domain/repositories/all_types_repositories.dart';

class GetAllTypesUseCase {
  final AllTypesRepositories _allTypesRepositories;

  GetAllTypesUseCase(this._allTypesRepositories);

  Future<Either<Failure, List<AllTypesDataModel>>> call() async {
    return await _allTypesRepositories.getAllCategories();
  }
}
