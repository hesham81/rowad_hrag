import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/profile_points_data_model.dart';
import '../repositories/profile_repositories.dart';

class GetProfilePointsUseCase {
  late ProfileRepositories _profileRepositories;

  GetProfilePointsUseCase(this._profileRepositories);

  Future<Either<Failure, List<ProfilePointsDataModel>>> call() async =>
      await _profileRepositories.getAllPoints();
}
