import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/data/models/banner_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/category_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/reviews_data_model.dart';
import 'package:rowad_hrag/features/layout/domain/entities/category.dart';

import '../../../../core/failures/failure.dart';

abstract class HomeReposatory {
  Future<Either<Failure, List<CategoryDataModel>>> getAllCategories();

  Future<Either<Failure, List<BannerDataModel>>> getAllBanners();

  Future<Either<Failure, List<ReviewsDataModel>>> getAllReviews();
}
