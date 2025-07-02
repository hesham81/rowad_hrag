import 'package:dio/dio.dart';
import 'package:rowad_hrag/features/plans/data/models/pay_to_plan_data_model.dart';

import '../models/add_ads_data_model.dart';

abstract class AddAdsInterfaceDataSource {
  Future<Response> addNewAdd(AddAdsDataModel ad);

  Future<Response> getAllCities();

  Future<Response> getStateById(int cityId);

}
