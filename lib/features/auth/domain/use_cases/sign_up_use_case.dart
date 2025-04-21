import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/auth/domain/entities/sign_up_request.dart';
import 'package:rowad_hrag/features/auth/domain/repositories/auth_reposatories.dart';

import '../../../../core/failures/failure.dart';
import '../../data/repositories/auth_reposatories_imp.dart';
import '../entities/sign_in_response.dart';

class SignUpUseCase {
  AuthReposatoriesImp _authReposatoriesImp;

  SignUpUseCase(this._authReposatoriesImp);

  Future<Either<Failure, SignInResponse>> call(SignUpRequest data) async {
    return _authReposatoriesImp.signUp(data);
  }
}
