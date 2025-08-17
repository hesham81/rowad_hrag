import 'package:dio/dio.dart';
import 'package:rowad_hrag/features/plans/data/models/pay_to_plan_data_model.dart';

abstract class PlansInterfaceDataSource {
  Future<Response> getAllPlans();

  Future<Response> payToPlan(PayToPlanDataModel pay);

  Future<Response> payCustomPlan(double amount);
}
