import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/adds_reviews/data/data_sources/adds_reviews_interface_data_source.dart';

class AddsReviewsRemoteDataSource implements AddsReviewsInterfaceDataSource {
  late Dio _dio;

  AddsReviewsRemoteDataSource(this._dio);

  @override
  Future<Response> getAllReviews() async {
    return await _dio.get(ApiEndPoints.addsReviews);
  }
}
