import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/all_adds_data_model.dart';
import '../repositories/profile_repositories.dart';

class GetAllAddsUseCase {
  late final ProfileRepositories _profileRepositories;

  GetAllAddsUseCase(this._profileRepositories);

  Future<Either<Failure, List<AllAddsDataModel>>> call() async =>
      await _profileRepositories.getAllAdds();
}
