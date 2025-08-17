import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/plans/data/models/plans_data_model.dart';
import 'package:rowad_hrag/features/plans/domain/repositories/plans_reposatory.dart';

import '../../../../core/failures/failure.dart';

class GetAllPlansUseCase {
  final PlansReposatory _plansReposatory;

  GetAllPlansUseCase(this._plansReposatory);

  Future<Either<Failure, List<PlansDataModel>>> call() async =>
      await _plansReposatory.getAllPlans();
}
