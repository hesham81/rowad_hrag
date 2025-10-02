import 'package:dartz/dartz.dart';


abstract class OnboardingRepository {
  Future<Either<Exception, Unit>> callApi();
}

