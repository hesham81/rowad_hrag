import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/adds_reviews_data_model.dart';
import '../repositories/adds_reviews_repositories.dart';

class GetAllAddsReviewsUseCase {
  late AddReviewsRepositories _addReviewsRepositories;

  GetAllAddsReviewsUseCase(this._addReviewsRepositories);

  Future<Either<Failure, List<AddsReviewsDataModel>>> call() async {
    return await _addReviewsRepositories.getAllReviews();
  }
}
