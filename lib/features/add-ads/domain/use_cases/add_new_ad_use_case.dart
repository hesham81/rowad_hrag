import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/add-ads/data/data_sources/add_ads_interface_data_source.dart';
import 'package:rowad_hrag/features/add-ads/data/models/add_ads_response_data_model.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/add_ads_data_model.dart';
import '../repositories/add_ads_repositories.dart';

class AddNewAdUseCase {
  late final AddAdsRepositories _addAdsRepositories;

  AddNewAdUseCase(this._addAdsRepositories);

  Future<Either<Failure, AddAdsResponseDataModel>> call(AddAdsDataModel ad) async {
    return await _addAdsRepositories.addNewAdd(ad);
  }
}
