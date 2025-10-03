import 'package:dartz/dartz.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../data_sources/remote/onboarding_remote_data_source.dart';


class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSource remoteDataSource;

  OnboardingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, Unit>> callApi() async {
    try {
      return Right(await remoteDataSource.callApi());
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

}

