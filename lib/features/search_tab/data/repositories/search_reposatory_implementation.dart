import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/core/failures/failures.dart';
import 'package:rowad_hrag/features/layout/data/models/products_data_model.dart';
import 'package:rowad_hrag/features/search_tab/data/data_sources/search_interface_data_source.dart';
import 'package:rowad_hrag/features/search_tab/data/models/search_request_data_model.dart';
import 'package:rowad_hrag/features/search_tab/domain/repositories/search_repo.dart';

class SearchReposatoryImplementation implements SearchReposatory {
  final SearchInterfaceDataSource _interfaceDataSource;

  SearchReposatoryImplementation(this._interfaceDataSource);

  @override
  Future<Either<Failure, List<ProductsDataModel>>> search(
      SearchRequestDataModel search) async {
    try {
      final response = await _interfaceDataSource.search(search);
      if (response.statusCode != 200) {
        return Left(
          ServerFailure(
            statusCode: "404",
            message: "error",
          ),
        );
      }
      if ((response.data['data'] as List).isEmpty) {
        return Right(
          [],
        );
      }

      List<ProductsDataModel> listOfData = (response.data['data'] as List)
          .map(
            (e) => ProductsDataModel.fromJson(e),
          )
          .toList();
      return Right(listOfData);
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: "404",
          message: error.response?.data['message'] ?? "Error 404",
        ),
      );
    }
  }
}
