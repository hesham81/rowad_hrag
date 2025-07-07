import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/data/models/add_rate_response_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/banner_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/category_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/reviews_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/top_sellers_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/visitor_status_data_model.dart';
import 'package:rowad_hrag/features/layout/domain/entities/add_rate_request.dart';
import 'package:rowad_hrag/features/layout/domain/entities/category.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/sub_categories_data_model.dart';

abstract class HomeReposatory {
  Future<Either<Failure, List<CategoryDataModel>>> getAllCategories();

  Future<Either<Failure, List<BannerDataModel>>> getAllBanners();

  Future<Either<Failure, List<BannerDataModel>>> getSecondBanner();

  Future<Either<Failure, List<ReviewsDataModel>>> getAllReviews();

  Future<Either<Failure, List<SubCategoriesDataModel>>> getSubCategories(
    int id,
  );

  Future<Either<Failure, List<ProductsDataModel>>> getSpecialProducts();

  Future<Either<Failure, List<ProductsDataModel>>>
      getPeopleWithSpecialNeedsProducts();

  Future<Either<Failure, List<ProductsDataModel>>>
      getProductiveFamiliesProducts();

  Future<Either<Failure, VisitorStatesDataModel>> getVisitorStates();

  Future<Either<Failure, List<TopSellersDataModel>>> getTopSellers();

  Future<Either<Failure, AddRateResponseDataModel>> addRate(
    AddRateRequest rate,
  );

  Future<Either<Failure , List<ProductsDataModel>>> getAllProducts();
}
