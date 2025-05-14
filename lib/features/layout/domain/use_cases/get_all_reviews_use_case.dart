import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/domain/repositories/home_reposatory.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/reviews_data_model.dart';

class GetAllReviewsUseCase {
  late HomeReposatory _homeReposatory;

  GetAllReviewsUseCase(this._homeReposatory);

  Future<Either<Failure, List<ReviewsDataModel>>> call() async {
    return await _homeReposatory.getAllReviews();
  }
}
