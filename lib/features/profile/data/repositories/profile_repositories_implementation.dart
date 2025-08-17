import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/bot_toast.dart';
import 'package:rowad_hrag/features/profile/data/data_sources/profile_interface_data_source.dart';
import 'package:rowad_hrag/features/profile/data/data_sources/remote_profile_data_source.dart';
import 'package:rowad_hrag/features/profile/data/models/all_adds_data_model.dart';
import 'package:rowad_hrag/features/profile/data/models/profile_points_data_model.dart';
import 'package:rowad_hrag/features/profile/data/models/seller_profile_data_model.dart';
import 'package:rowad_hrag/features/profile/domain/repositories/profile_repositories.dart';
import 'package:rowad_hrag/main.dart';

import '../../../../core/failures/server_failure.dart';

class ProfileRepositoriesImplementation implements ProfileRepositories {
  final ProfilesInterfaceDataSource _dataSource;

  ProfileRepositoriesImplementation(this._dataSource);

  @override
  Future<Either<Failure, SellerProfileDataModel>> getProfileData() async {
    try {
      final response = await _dataSource.getProfileData();
      log("This is the response.data['data'] ------> ${response.data['data']}");
      var data = SellerProfileDataModel.fromJson(response.data["data"]);
      return Right(data);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<Either<Failure, List<AllAddsDataModel>>> getAllAdds() async {
    try {
      var response = await _dataSource.getAllAdds();
      var data = (response.data["data"] as List)
          .map((e) => AllAddsDataModel.fromJson(e))
          .toList();
      return Right(data);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<Either<Failure, List<ProfilePointsDataModel>>> getAllPoints() async {
    try {
      var response = await _dataSource.getAllPoints();
      List<ProfilePointsDataModel> data = List.from(response.data['points'])
          .map(
            (e) => ProfilePointsDataModel.fromJson(e),
          )
          .toList();
      return Right(data);
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "501",
          message: error.response?.data["message"],
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> deleteAccount() async {
    try {
      var response = await _dataSource.deleteAccount();

      return Right(
        response.data["message"],
      );
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "501",
          message: error.response?.data["message"],
        ),
      );
    } catch (error) {
      throw Exception(error);
    }
  }
}
