import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rowad_hrag/core/failures/failures.dart';
import 'package:rowad_hrag/features/layout/data/data_sources/home_interface_data_source.dart';
import 'package:rowad_hrag/features/layout/data/models/banner_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/category_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/layout/data/models/reviews_data_model.dart';
import 'package:rowad_hrag/features/sub_categories/data/models/sub_categories_data_model.dart';
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
      if (response.statusCode == 200 ) {
        final List<dynamic> jsonData = response.data["reviews"];
        final List<ReviewsDataModel> reviews =
            jsonData.map((e) => ReviewsDataModel.fromJson(e)).toList();
        return Right(reviews);
      } else {
        return Left(ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data["message"],
        ));
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
  Future<Either<Failure, List<SubCategoriesDataModel>>> getSubCategories(
    int id,
  ) async {
    try {
      var response = await _interfaceDataSource.getSubCategories(id);
      final List<dynamic> jsons = response.data["data"];
      final List<SubCategoriesDataModel> subCategories = jsons
          .map(
            (e) => SubCategoriesDataModel.fromJson(e),
          )
          .toList();
      return Right(subCategories);
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
  Future<Either<Failure, List<ProductsDataModel>>> getSpecialProducts() async{
    try {
      var response = await _interfaceDataSource.getAllSpecialProducts();
      if (response.statusCode == 200  ) {
        final List<dynamic> jsonData = response.data["data"];
        final List<ProductsDataModel> reviews =
        jsonData.map((e) => ProductsDataModel.fromJson(e)).toList();
        return Right(reviews);
      } else {
        return Left(ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data["message"],
        ));
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
  Future<Either<Failure, List<BannerDataModel>>> getSecondBanner() async {
    try {
      var response = await _interfaceDataSource.getSecondBanner();
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
  Future<Either<Failure, List<ProductsDataModel>>> getPeopleWithSpecialNeedsProducts()async {
    try {
      var response = await _interfaceDataSource.getPeopleWithSpecialNeedsProducts();
      if (response.statusCode == 200  ) {
        final List<dynamic> jsonData = response.data["data"];
        final List<ProductsDataModel> reviews =
        jsonData.map((e) => ProductsDataModel.fromJson(e)).toList();
        return Right(reviews);
      } else {
        return Left(ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data["message"],
        ));
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
}
