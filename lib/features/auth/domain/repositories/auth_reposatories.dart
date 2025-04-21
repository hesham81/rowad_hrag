import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/auth/data/models/sign_up_data_model.dart';
import 'package:rowad_hrag/features/auth/data/models/city_data_model.dart';
import '../entities/sign_in_response.dart';
import '../entities/sign_up_request.dart';
import '/core/failures/failure.dart';
import '/features/auth/domain/entities/sign_in_request.dart';

abstract class AuthReposatories {
  Future<Either<Failure, SignInResponse>> signIn(SignInRequest data);

  Future<Either<Failure, SignInResponse>> signUp(SignUpDataModel data);

  forgetPassword();

  Future<Either<Failure, List<CityDataModel>>> getAllCities();

  Future<Either<Failure, List<String>>>getState(String stateId);
}
