import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/core/failures/failures.dart';
import 'package:rowad_hrag/features/add-ads/data/data_sources/add_ads_interface_data_source.dart';

import 'package:rowad_hrag/features/add-ads/data/models/add_ads_data_model.dart';
import 'package:rowad_hrag/features/add-ads/data/models/add_ads_response_data_model.dart';

import '../../../auth/data/models/city_data_model.dart';
import '../../../auth/data/models/states_data_model.dart';
import '../../domain/repositories/add_ads_repositories.dart';

class AddAdsRepsitoriesImplementation implements AddAdsRepositories {
  late final AddAdsInterfaceDataSource _interfaceDataSource;

  AddAdsRepsitoriesImplementation(this._interfaceDataSource);

  @override
  Future<Either<Failure, AddAdsResponseDataModel>> addNewAdd(
    AddAdsDataModel ad,
  ) async {
    var response = await _interfaceDataSource.addNewAdd(ad);
    try {
      AddAdsResponseDataModel _model = AddAdsResponseDataModel.fromJson(
        response.data['product'],
      );
      return Right(_model);
    } catch (error) {
      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data['errors'],
        ),
      );
    }
  }


  @override
  Future<Either<Failure, List<CityDataModel>>> getAllCities() async {
    try {
      final response = await _interfaceDataSource.getAllCities();
      if (response.statusCode == 200 && response.data["sucess"] != false) {
        final List<dynamic> jsonData = response.data["data"];
        final List<CityDataModel> data =
        jsonData.map((json) => CityDataModel.fromJson(json)).toList();
        return Right(
          data,
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
          statusCode: error.response!.statusCode!.toString(),
          message: error.response!.data["message"],
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<StatesDataModel>>> getState(
      int stateId) async {
    try {
      final response = await _interfaceDataSource.getStateById(stateId);
      if (response.statusCode == 200 && response.data["sucess"] != false) {
        final List<dynamic> jsonData = response.data["data"];
        final List<StatesDataModel> data =
        jsonData.map((json) => StatesDataModel.fromJson(json)).toList();
        return Right(
          data,
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
          statusCode: error.response!.statusCode!.toString(),
          message: error.response!.data["message"],
        ),
      );
    }
  }
}
