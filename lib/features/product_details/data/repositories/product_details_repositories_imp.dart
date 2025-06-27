import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/auth/data/models/city_data_model.dart';
import 'package:rowad_hrag/features/auth/data/models/states_data_model.dart';
import 'package:rowad_hrag/features/product_details/data/data_sources/product_interface_data_source.dart';
import 'package:rowad_hrag/features/product_details/data/models/product_details_data_model.dart';
import 'package:rowad_hrag/features/product_details/domain/repositories/product_details_repo.dart';

import '../../../../core/failures/server_failure.dart';

class ProdcutDetailsRepositoriesImp implements ProductDetailsRepo {
  final ProductInterfaceDataSource _interfaceDataSource;

  ProdcutDetailsRepositoriesImp(this._interfaceDataSource);

  @override
  Future<Either<Failure, ProductDetailsDataModel>> getProductDetails(
    String id,
  ) async {
    try {
      var response = await _interfaceDataSource.getProductDetails(id);
      var data = ProductDetailsDataModel.fromJson(response.data);
      return Right(data);
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
  Future<Either<Failure, List<CityDataModel>>> getStates() async {
    try {
      final response = await _interfaceDataSource.getState();
      final data = List<CityDataModel>.from(
        response.data.map(
          (x) => CityDataModel.fromJson(x),
        ),
      );
      return Right(data);
    } catch (error) {
      return Left(
        ServerFailure(
          statusCode: "404",
          message: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<StatesDataModel>>> getCities(int id) async {
    try {
      final response = await _interfaceDataSource.getCities(id);
      final data = List<StatesDataModel>.from(
        response.data.map(
          (x) => StatesDataModel.fromJson(x),
        ),
      );
      return Right(data);
    } catch (error) {
      return Left(
        ServerFailure(
          statusCode: "404",
          message: error.toString(),
        ),
      );
    }
  }
}
