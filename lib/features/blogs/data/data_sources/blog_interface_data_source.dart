import 'package:dio/dio.dart';

abstract class BlogInterfaceDataSource{
  Future<Response> getBlogs();
}