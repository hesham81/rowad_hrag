import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/data/models/banner_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/category_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/reviews_data_model.dart';
import 'package:rowad_hrag/features/sub_categories/data/models/sub_categories_data_model.dart';

// ignore: unused_import
import 'package:rowad_hrag/features/layout/domain/entities/category.dart';

import '../../../../core/failures/failure.dart';

abstract class HomeReposatory {
  Future<Either<Failure, List<CategoryDataModel>>> getAllCategories();

  Future<Either<Failure, List<BannerDataModel>>> getAllBanners();
  Future<Either<Failure, List<BannerDataModel>>> getSecondBanner();

  Future<Either<Failure, List<ReviewsDataModel>>> getAllReviews();

  Future<Either<Failure, List<SubCategoriesDataModel>>> getSubCategories(
    int id,
  );

  Future<Either<Failure, List<ProductsDataModel>>> getSpecialProducts();
}
