import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/plans/domain/repositories/plans_reposatory.dart';

import '../../../../core/failures/failure.dart';

class PayCustomPaymentWith1PercentUseCase {
  late final PlansReposatory _plansReposatory;

  PayCustomPaymentWith1PercentUseCase(this._plansReposatory);

  Future<Either<Failure, String>> call(double amount) async {
    return await _plansReposatory.payCustomPlan(amount);
  }
}
