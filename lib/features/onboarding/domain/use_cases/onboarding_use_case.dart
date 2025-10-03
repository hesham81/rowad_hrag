import 'package:dartz/dartz.dart';
import '../repositories/onboarding_repository.dart';


class OnboardingUseCase {
  final OnboardingRepository repository;

  OnboardingUseCase(this.repository);

  Future<Either<Exception, Unit>> call() async {
    return await repository.callApi();
  }
}

