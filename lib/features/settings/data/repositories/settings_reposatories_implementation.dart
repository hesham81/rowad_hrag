import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/core/failures/failures.dart';
import 'package:rowad_hrag/features/settings/data/data_sources/home_settings_interface_data_source.dart';

import 'package:rowad_hrag/features/settings/data/models/settings_data_model.dart';

import '../../domain/repositories/settings_reposatories.dart';

class SettingsReposatoriesImplementation implements SettingsReposatories {
  late final HomeSettingsInterfaceDataSource _interfaceDataSource;

  SettingsReposatoriesImplementation(this._interfaceDataSource);

  @override
  Future<Either<Failure, List<SettingsDataModel>>> getHomeSettings() async {
    try {
      var response = await _interfaceDataSource.getHomeSettings();
      var data = (response.data['data'] as List)
          .map((e) => SettingsDataModel.fromJson(e))
          .toList();
      return Right(data);
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "505",
          messageAr: error.message,
        ),
      );
    }
  }
}
