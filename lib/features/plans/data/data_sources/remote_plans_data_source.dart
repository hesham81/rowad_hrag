import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/features/plans/data/data_sources/plans_interface_data_source.dart';

import '../../../../core/constant/api_networks.dart';

class RemotePlansDataSource implements PlansInterfaceDataSource {
  final Dio _dio;

  RemotePlansDataSource(this._dio);

  @override
  Future<Response> getAllPlans() async {
    return await _dio.get(ApiEndPoints.plans);
  }
}
