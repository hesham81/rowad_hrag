import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/plans/data/data_sources/plans_interface_data_source.dart';
import 'package:rowad_hrag/features/plans/data/models/pay_to_plan_data_model.dart';
import 'package:rowad_hrag/features/plans/data/models/plans_data_model.dart';
import 'package:rowad_hrag/features/plans/domain/repositories/plans_reposatory.dart';

import '../../../../core/failures/server_failure.dart';

class PlansRepoImplementation implements PlansReposatory {
  late PlansInterfaceDataSource _dataSource;

  PlansRepoImplementation(
    this._dataSource,
  );

  @override
  Future<Either<Failure, List<PlansDataModel>>> getAllPlans() async {
    try {
      var response = await _dataSource.getAllPlans();
      List<PlansDataModel> plans = List.from(response.data['plans'])
          .map(
            (e) => PlansDataModel.fromJson(e),
          )
          .toList();
      return Right(plans);
    } on DioException catch (error) {
      throw Exception(error.message);
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "",
          message: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> payToPlan(PayToPlanDataModel pay) async {
    try {
      var response = await _dataSource.payToPlan(pay);
      return Right(
        response.data['payment_url'],
      );
    } on DioException catch (error) {
      // throw Exception(error.message);
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "",
          message: error.message,
        ),
      );
    }
  }
}
