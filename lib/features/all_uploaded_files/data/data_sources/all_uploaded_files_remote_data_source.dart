import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/all_uploaded_files/data/data_sources/all_uploaded_files_interface_data_source.dart';

class AllUploadedFilesRemoteDataSource
    implements AllUploadedFilesInterfaceDataSource {
  late Dio _dio;

  AllUploadedFilesRemoteDataSource(this._dio);

  @override
  Future<Response> getAllUploadedFiles() async {
    return await _dio.get(ApiEndPoints.getAllFiles);
  }
}
