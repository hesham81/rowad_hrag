import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rowad_hrag/core/failures/failures.dart';
import 'package:rowad_hrag/features/layout/data/data_sources/home_interface_data_source.dart';
import 'package:rowad_hrag/features/layout/data/models/category_data_model.dart';
import 'package:rowad_hrag/features/layout/domain/entities/category.dart';
import 'package:rowad_hrag/features/layout/domain/repositories/home_reposatory.dart';

class HomeReposatoriesImplementation implements HomeReposatory {
  HomeInterfaceDataSource _interfaceDataSource;

  HomeReposatoriesImplementation(this._interfaceDataSource);

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    try {
      var response = await _interfaceDataSource.getCategories();
      if (response.statusCode == 200) {
        return Right(
          List<CategoryDataModel>.from(
            response.data.map(
              (x) => CategoryDataModel.fromJson(x),
            ),
          ),
        );
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
          message: error.response?.data["message"] ?? "Something Went Wrong",
        ),
      );
    }
  }
}
