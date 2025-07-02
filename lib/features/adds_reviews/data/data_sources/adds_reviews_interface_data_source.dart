import 'package:dio/dio.dart';

abstract class AddsReviewsInterfaceDataSource {
  Future<Response> getAllReviews();
}
