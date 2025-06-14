import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/core/failures/failures.dart';
import 'package:rowad_hrag/features/all_types/data/models/all_types_data_model.dart';
import 'package:rowad_hrag/features/all_types/domain/repositories/all_types_repositories.dart';

import '../data_sources/all_types_interface_data_source.dart';

class AllTypesRepositoriesImplementation implements AllTypesRepositories {
  final AllTypesInterfaceDataSource _allTypesInterfaceDataSource;

  AllTypesRepositoriesImplementation(this._allTypesInterfaceDataSource);

  @override
  Future<Either<Failure, List<AllTypesDataModel>>> getAllCategories() async {
    try {
      final response = await _allTypesInterfaceDataSource.getAllTypes();
      if (response.data["status"]) {
        List<AllTypesDataModel> data = List.from(response.data["categories"])
            .map(
              (e) => AllTypesDataModel.fromJson(e),
            )
            .toList();
        return Right(data);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data,
          ),
        );
      }
    } catch (error) {
      return Left(
        ServerFailure(
          statusCode: "401",
          message: error.toString(),
        ),
      );
    }
  }
}
