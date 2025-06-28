import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/add-ads/data/models/add_ads_data_model.dart';
import 'package:rowad_hrag/features/add-ads/data/models/add_ads_response_data_model.dart';

import '../../../auth/data/models/city_data_model.dart';
import '../../../auth/data/models/states_data_model.dart';

abstract class AddAdsRepositories {
  Future<Either<Failure, AddAdsResponseDataModel>> addNewAdd(AddAdsDataModel ad);


  Future<Either<Failure, List<CityDataModel>>> getAllCities();

  Future<Either<Failure, List<StatesDataModel>>> getState(int stateId);
}
