import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/auth/data/repositories/auth_reposatories_imp.dart';

import '../../../../core/failures/failure.dart';

class GetStateUseCase {
  AuthReposatoriesImp _authReposatoriesImp;

  GetStateUseCase(this._authReposatoriesImp);

  Future<Either<Failure, List<String>>> call(String stateId) async {
    return await _authReposatoriesImp.getState(stateId);
  }
}
