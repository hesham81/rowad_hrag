import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/adds_reviews/data/models/adds_reviews_data_model.dart';

import '../../../../core/failures/failure.dart';

abstract class AddReviewsRepositories {
  Future<Either<Failure, List<AddsReviewsDataModel>>> getAllReviews();
}