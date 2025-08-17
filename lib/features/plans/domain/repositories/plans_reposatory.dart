import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/pay_to_plan_data_model.dart';
import '../../data/models/plans_data_model.dart';

abstract class PlansReposatory {
  Future<Either<Failure, List<PlansDataModel>>> getAllPlans();

  Future<Either<Failure, String>> payToPlan(PayToPlanDataModel pay);

  Future<Either<Failure, String>> payCustomPlan(double amount);
}
