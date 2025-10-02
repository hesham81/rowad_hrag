import 'package:dartz/dartz.dart';


abstract class OnboardingLocalDataSource {
  Future<Unit> getFromLocalDataBase();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  OnboardingLocalDataSourceImpl();

  @override
  Future<Unit> getFromLocalDataBase() async {
    // send api request here
    return Future.value(unit);
  }

}


  