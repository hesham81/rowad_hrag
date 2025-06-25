import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/core/failures/failures.dart';
import 'package:rowad_hrag/features/all_uploaded_files/data/data_sources/all_uploaded_files_interface_data_source.dart';

import 'package:rowad_hrag/features/all_uploaded_files/data/models/uploaded_files_data_model.dart';

import '../../domain/repositories/uploaded_files_repositories.dart';

class UploadedFilesRepositoriesImplementation
    implements UploadedFilesRepositories {
  late AllUploadedFilesInterfaceDataSource _dataSource;

  UploadedFilesRepositoriesImplementation(this._dataSource);

  @override
  Future<Either<Failure, List<UploadedFilesDataModel>>>
      getAllUploadedFiles() async {
    try {
      final response = await _dataSource.getAllUploadedFiles();
      List<UploadedFilesDataModel> files = List.from(response.data['data'])
          .map(
            (e) => UploadedFilesDataModel.fromJson(e),
          )
          .toList();
      return Right(files);
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "404",
          message: error.message,
        ),
      );
    }
  }
}
