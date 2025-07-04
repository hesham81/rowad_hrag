import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/features/plans/data/data_sources/plans_interface_data_source.dart';
import 'package:rowad_hrag/features/plans/data/models/pay_to_plan_data_model.dart';

import '../../../../core/constant/api_networks.dart';

class RemotePlansDataSource implements PlansInterfaceDataSource {
  final Dio _dio;

  RemotePlansDataSource(this._dio);

  @override
  Future<Response> getAllPlans() async {
    return await _dio.get(ApiEndPoints.plans);
  }

  @override
  Future<Response> payToPlan(PayToPlanDataModel pay) async {
    return await _dio.post(
      ApiEndPoints.payToPlan,
      data: pay.toJson(),
    );
  }

  @override
  Future<Response> payCustomPlan(double amount) async {
    return await _dio.post(
      ApiEndPoints.customPayment,
      data: {
        "amount": amount,
      },
    );
  }
}
