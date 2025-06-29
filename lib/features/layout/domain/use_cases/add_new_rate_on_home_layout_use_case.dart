import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/add_rate_response_data_model.dart';
import '../entities/add_rate_request.dart';
import '../repositories/home_reposatory.dart';

class AddNewRateOnHomeLayoutUseCase {
  final HomeReposatory _homeReposatory;

  AddNewRateOnHomeLayoutUseCase(this._homeReposatory);

  Future<Either<Failure, AddRateResponseDataModel>> call(
    AddRateRequest rate,
  ) {
    return _homeReposatory.addRate(rate);
  }
}
