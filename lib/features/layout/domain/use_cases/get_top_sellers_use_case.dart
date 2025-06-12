import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/domain/repositories/home_reposatory.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/top_sellers_data_model.dart';

class GetTopSellersUseCase {
  final HomeReposatory _homeReposatory ;

  GetTopSellersUseCase(this._homeReposatory);

  Future<Either<Failure, List<TopSellersDataModel>>> call() async {
    return await _homeReposatory.getTopSellers();
  }
}
