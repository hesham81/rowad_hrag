import 'package:dartz/dartz.dart';
import '../../../../core/failures/failure.dart';
import '../../../auth/data/models/states_data_model.dart';
import '../repositories/add_ads_repositories.dart';

class GetStateUseCase {
  late final AddAdsRepositories _addAdsRepositories;

  GetStateUseCase(this._addAdsRepositories);

  Future<Either<Failure, List<StatesDataModel>>> call(int stateId) async {
    return await _addAdsRepositories.getState(stateId);
  }
}
