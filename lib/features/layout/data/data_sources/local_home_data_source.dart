import 'package:dio/src/response.dart';
import 'package:rowad_hrag/features/layout/data/data_sources/home_interface_data_source.dart';
import 'package:rowad_hrag/features/layout/domain/entities/add_rate_request.dart';

class LocalHomeDataSource implements HomeInterfaceDataSource{
  @override
  Future<Response> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Response> getAllSpecialProducts() {
    // TODO: implement getAllSpecialProducts
    throw UnimplementedError();
  }

  @override
  Future<Response> getBanners() {
    // TODO: implement getBanners
    throw UnimplementedError();
  }

  @override
  Future<Response> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Response> getPeopleWithSpecialNeedsProducts() async{
    // TODO: implement getPeopleWithSpecialNeedsProducts
    throw UnimplementedError();
  }

  @override
  Future<Response> getProductiveFamiliesProducts() {
    // TODO: implement getProductiveFamiliesProducts
    throw UnimplementedError();
  }

  @override
  Future<Response> getReviews() {
    // TODO: implement getReviews
    throw UnimplementedError();
  }

  @override
  Future<Response> getSecondBanner() {
    // TODO: implement getSecondBanner
    throw UnimplementedError();
  }

  @override
  Future<Response> getStates() {
    // TODO: implement getStates
    throw UnimplementedError();
  }

  @override
  Future<Response> getSubCategories(int id) {
    // TODO: implement getSubCategories
    throw UnimplementedError();
  }

  @override
  Future<Response> getTopSellers() {
    // TODO: implement getTopSellers
    throw UnimplementedError();
  }

  @override
  Future<Response> getVisitorsState() {
    // TODO: implement getVisitorsState
    throw UnimplementedError();
  }

  @override
  Future<Response> sendComment(AddRateRequest rate) {
    // TODO: implement sendComment
    throw UnimplementedError();
  }
}