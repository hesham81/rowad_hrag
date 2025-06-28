import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/add-ads/domain/repositories/add_ads_repositories.dart';

import '../../../../core/failures/failure.dart';
import '../../../auth/data/models/city_data_model.dart';
import '../../data/data_sources/add_ads_interface_data_source.dart';

class GetCityUseCase {
  late final AddAdsRepositories _addAdsRepositories;

  GetCityUseCase(this._addAdsRepositories);

  Future<Either<Failure, List<CityDataModel>>> call() async {
    return await _addAdsRepositories.getAllCities();
  }
}
