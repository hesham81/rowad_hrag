import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rowad_hrag/core/failures/failures.dart';
import 'package:rowad_hrag/features/layout/data/data_sources/home_interface_data_source.dart';
import 'package:rowad_hrag/features/layout/data/models/banner_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/category_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/reviews_data_model.dart';
import 'package:rowad_hrag/features/layout/domain/repositories/home_reposatory.dart';

class HomeReposatoriesImplementation implements HomeReposatory {
  HomeInterfaceDataSource _interfaceDataSource;

  HomeReposatoriesImplementation(this._interfaceDataSource);

  @override
  Future<Either<Failure, List<CategoryDataModel>>> getAllCategories() async {
    try {
      var response = await _interfaceDataSource.getCategories();
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data["data"];

        final List<CategoryDataModel> categories =
            jsonData.map((e) => CategoryDataModel.fromJson(e)).toList();
        return Right(categories);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );
      }
    } on DioException catch (error) {
      throw Exception(error.toString());
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "",
          message: error.response?.data["message"] ?? "Something Went Wrong",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BannerDataModel>>> getAllBanners() async {
    try {
      var response = await _interfaceDataSource.getBanners();
      if (response.statusCode == 200 && response.data["success"]) {
        final List<dynamic> jsonData = response.data["data"];
        final List<BannerDataModel> banners =
            jsonData.map((e) => BannerDataModel.fromJson(e)).toList();
        return Right(banners);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );
      }
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "",
          message: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ReviewsDataModel>>> getAllReviews() async {
    try {
      var response = await _interfaceDataSource.getReviews();
      final List<dynamic> jsonData = response.data["reviews"];
      final List<ReviewsDataModel> reviews =
          jsonData.map((e) => ReviewsDataModel.fromJson(e)).toList();
      return Right(reviews);
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "",
          message: error.message,
        ),
      );
    }
  }
}
