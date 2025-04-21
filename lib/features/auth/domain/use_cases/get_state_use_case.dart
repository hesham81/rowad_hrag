import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/auth/data/repositories/auth_reposatories_imp.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/states_data_model.dart';

class GetStateUseCase {
  AuthReposatoriesImp _authReposatoriesImp;

  GetStateUseCase(this._authReposatoriesImp);

  Future<Either<Failure, List<StatesDataModel>>> call(int stateId) async {
    return await _authReposatoriesImp.getState(stateId);
  }
}
