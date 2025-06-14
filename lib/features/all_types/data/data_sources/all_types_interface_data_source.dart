import 'package:dio/dio.dart';

abstract class AllTypesInterfaceDataSource {
  Future<Response> getAllTypes();
}
