import 'package:dartz/dartz.dart';
import '../entities/sign_in_response.dart';
import '/core/failures/failure.dart';
import '/features/auth/data/repositories/auth_reposatories_imp.dart';
import '/features/auth/domain/entities/sign_in_request.dart';

class SignInUseCase {
  AuthReposatoriesImp _authReposatoriesImp;

  SignInUseCase(this._authReposatoriesImp);

  Future<Either<Failure, SignInResponse>> call(SignInRequest data) async {
    return _authReposatoriesImp.signIn(data);
  }
}
