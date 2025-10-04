import 'package:dartz/dartz.dart';


abstract class OnboardingRemoteDataSource {
  Future<Unit> callApi();
}

class OnboardingRemoteDataSourceImpl implements OnboardingRemoteDataSource {
  OnboardingRemoteDataSourceImpl();

  @override
  Future<Unit> callApi() async {
    // send api request here
    return Future.value(unit);
  }

}


  