import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/auth/data/models/city_data_model.dart';
import 'package:rowad_hrag/features/auth/data/models/city_data_model.dart';
import 'package:rowad_hrag/features/auth/data/models/city_data_model.dart';
import 'package:rowad_hrag/features/auth/data/models/city_data_model.dart';
import 'package:rowad_hrag/features/auth/data/models/states_data_model.dart';
import 'package:rowad_hrag/features/product_details/data/data_sources/product_interface_data_source.dart';
import 'package:rowad_hrag/features/product_details/data/models/message_request_data_model.dart';
import 'package:rowad_hrag/features/product_details/data/models/pay_to_product_request_data_model.dart';
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
  Future<Either<Failure, CityDataModel>> getState(int id) async {
    try {
      var response = await _interfaceDataSource.getState(id);

      List<CityDataModel> data = List.from(response.data['data'])
          .map(
            (e) => CityDataModel.fromJson(e),
          )
          .toList();

      CityDataModel model = data
          .where(
            (element) => element.id == id,
          )
          .first;
      return Right(model);
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
  Future<Either<Failure, List<StatesDataModel>>> getCityById(int id) async {
    try {
      var response = await _interfaceDataSource.getState(id);
      List<StatesDataModel> data = List.from(response.data['data'])
          .map(
            (e) => StatesDataModel.fromJson(e),
          )
          .toList();
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
  Future<Either<Failure, String>> payToProduct(double amount) async {
    try {
      var payment = PayToProductRequestDataModel(amount: amount);
      var response = await _interfaceDataSource.pay(payment);
      return Right(
        response.data['payment_url'],
      );
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
  Future<Either<Failure, String>> sendMessage(
    MessageRequestDataModel message,
  ) async {
    try {
      var response = await _interfaceDataSource.sendMessage(message);
      return Right(
        response.data['message'],
      );
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
