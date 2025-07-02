import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/pay_to_plan_data_model.dart';
import '../repositories/plans_reposatory.dart';

class PayToPlanUseCase {
  late final PlansReposatory _plansReposatory;

  PayToPlanUseCase(this._plansReposatory);

  Future<Either<Failure, String>> call(PayToPlanDataModel pay) async =>
      await _plansReposatory.payToPlan(pay);
}
