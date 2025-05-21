import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/auth/data/models/city_data_model.dart';
import 'package:rowad_hrag/features/auth/data/repositories/auth_reposatories_imp.dart';

import '../../../../core/failures/failure.dart';

class GetCityUseCase {
  final AuthReposatoriesImp _authReposatoriesImp;

  GetCityUseCase(this._authReposatoriesImp);

  Future<Either<Failure, List<CityDataModel>>> call() async {
    return await _authReposatoriesImp.getAllCities();
  }
}
