import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/add-ads/data/data_sources/add_ads_interface_data_source.dart';
import 'package:rowad_hrag/features/add-ads/data/models/add_ads_data_model.dart';

class AddAdsRemoteDataSource implements AddAdsInterfaceDataSource {
  late final Dio _dio;

  AddAdsRemoteDataSource(this._dio);

  @override
  Future<Response> addNewAdd(AddAdsDataModel ad) async {
    return await _dio.post(
      ApiEndPoints.addAdds,
      data: ad.toJson(),
    );
  }

  @override
  Future<Response> getAllCities() async {
    return await _dio.get(
      ApiEndPoints.states,
    );
  }

  @override
  Future<Response> getStateById(int cityId) async {
    return await _dio.get(
      "${ApiEndPoints.cityByStateId}/$cityId",
    );
  }
}
