import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/auth/data/models/sign_up_data_model.dart';
import '../entities/sign_in_response.dart';
import '../entities/sign_up_request.dart';
import '/core/failures/failure.dart';
import '/features/auth/domain/entities/sign_in_request.dart';

abstract class AuthReposatories {
  Future<Either<Failure, SignInResponse>> signIn(SignInRequest data);

  signUp(SignUpDataModel data);

  forgetPassword();
}
