import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/profile/data/data_sources/profile_interface_data_source.dart';
import 'package:rowad_hrag/features/profile/data/data_sources/remote_profile_data_source.dart';
import 'package:rowad_hrag/features/profile/data/models/all_adds_data_model.dart';
import 'package:rowad_hrag/features/profile/data/models/seller_profile_data_model.dart';
import 'package:rowad_hrag/features/profile/domain/repositories/profile_repositories.dart';

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
}
