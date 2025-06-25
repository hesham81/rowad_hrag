import 'package:dartz/dartz.dart';

import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/adds_reviews/data/data_sources/adds_reviews_interface_data_source.dart';

import 'package:rowad_hrag/features/adds_reviews/data/models/adds_reviews_data_model.dart';

import '../../domain/repositories/adds_reviews_repositories.dart';

class AddsReviewsRepositoriesImplementation extends AddReviewsRepositories {
  late AddsReviewsInterfaceDataSource _dataSource;

  AddsReviewsRepositoriesImplementation(this._dataSource);

  @override
  Future<Either<Failure, List<AddsReviewsDataModel>>> getAllReviews() async {
    try {
      final response = await _dataSource.getAllReviews();
      List<AddsReviewsDataModel> adds = List.from(response.data['data'])
          .map(
            (e) => AddsReviewsDataModel.fromJson(e),
          )
          .toList();
      return Right(adds);
    } catch (error) {
      throw Exception(error);
    }
  }
}
