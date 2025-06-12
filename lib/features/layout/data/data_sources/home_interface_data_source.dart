import 'package:dio/dio.dart';

abstract class HomeInterfaceDataSource {
  Future<Response> getStates();

  Future<Response> getCategories();

  Future<Response> getBanners();

  Future<Response> getReviews();

  Future<Response> getSubCategories(int id);

  Future<Response> getAllSpecialProducts();

  Future<Response> getSecondBanner();

  Future<Response> getPeopleWithSpecialNeedsProducts();

  Future<Response> getProductiveFamiliesProducts();

  Future<Response> getVisitorsState();
}
