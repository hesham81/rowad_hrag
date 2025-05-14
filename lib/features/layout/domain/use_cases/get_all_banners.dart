import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/domain/repositories/home_reposatory.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/banner_data_model.dart';

class GetAllBannersUseCase {
  final HomeReposatory _homeReposatory;

  GetAllBannersUseCase(this._homeReposatory);

  Future<Either<Failure, List<BannerDataModel>>> call() async {
    return await _homeReposatory.getAllBanners();
  }
}
