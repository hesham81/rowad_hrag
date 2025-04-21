import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rowad_hrag/features/auth/data/models/sign_up_data_model.dart';
import 'package:rowad_hrag/features/auth/domain/entities/sign_up_request.dart';
import '/core/failures/failures.dart';
import '/features/auth/data/data_sources/auth_interface_data_source.dart';
import '/features/auth/data/models/sign_in_model.dart';
import '/features/auth/domain/entities/sign_in_request.dart';
import '/features/auth/domain/entities/sign_in_response.dart';
import '../../domain/repositories/auth_reposatories.dart';

class AuthReposatoriesImp implements AuthReposatories {
  AuthInterfaceDataSource _authInterfaceDataSource;

  AuthReposatoriesImp(this._authInterfaceDataSource);

  @override
  forgetPassword() {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SignInResponse>> signIn(SignInRequest data) async {
    try {
      final response = await _authInterfaceDataSource.signIn(data);
      if (response.statusCode == 200) {
        return Right(
          SignInModel.fromJson(
            response.data,
          ),
        );
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );
      }
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response!.statusCode!.toString(),
          message: error.response!.data["message"],
        ),
      );
    }
  }

  @override
  signUp(SignUpDataModel data) async {
    try {
      final response = await _authInterfaceDataSource.signUp(data);
      if (response.statusCode == 200) {
        return Right(
          SignInModel.fromJson(
            response.data,
          ),
        );
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );
      }
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response!.statusCode!.toString(),
          message: error.response!.data["message"],
        ),
      );
    }
  }
}
