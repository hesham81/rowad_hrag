import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/plans_data_model.dart';

abstract class PlansReposatory {
  Future<Either<Failure, List<PlansDataModel>>> getAllPlans();
}
