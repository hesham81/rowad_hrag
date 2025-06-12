import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/layout/data/data_sources/home_interface_data_source.dart';

class RemoteHomeDataSource implements HomeInterfaceDataSource {
  Dio _dio;

  RemoteHomeDataSource(this._dio);

  @override
  Future<Response> getCategories() async {
    return await _dio.get(ApiEndPoints.categories);
  }

  @override
  Future<Response> getStates() {
    throw UnimplementedError();
  }

  @override
  Future<Response> getBanners() async {
    return await _dio.get(ApiEndPoints.banners);
  }

  @override
  Future<Response> getReviews() async {
    return await _dio.get(ApiEndPoints.reviews);
  }

  @override
  Future<Response> getSubCategories(int id) async {
    return await _dio.get("${ApiEndPoints.subCategories}/$id");
  }

  @override
  Future<Response> getAllSpecialProducts() async {
    return await _dio.get(ApiEndPoints.specialProducts);
  }

  @override
  Future<Response> getSecondBanner() async {
    return await _dio.get(ApiEndPoints.secondBanner);
  }

  @override
  Future<Response> getPeopleWithSpecialNeedsProducts() async {
    return await _dio.get(ApiEndPoints.peopleWithSpecialNeeds);
  }

  @override
  Future<Response> getProductiveFamiliesProducts() async {
    return await _dio.get(ApiEndPoints.productiveFamilies);
  }

  @override
  Future<Response> getVisitorsState() async {
    return await _dio.get(ApiEndPoints.visitorState);
  }

  @override
  Future<Response> getTopSellers() async {
    return await _dio.get(ApiEndPoints.topSellers);
  }
}
