import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/blogs/data/data_sources/blog_interface_data_source.dart';

class RemoteBlogDataSource extends BlogInterfaceDataSource {
  Dio _dio;

  RemoteBlogDataSource(this._dio);

  @override
  Future<Response> getBlogs() async {
    return await _dio.get(ApiEndPoints.blogs);
  }
}
