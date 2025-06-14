import 'package:dio/dio.dart';

abstract class PlansInterfaceDataSource {

  Future<Response> getAllPlans();
}