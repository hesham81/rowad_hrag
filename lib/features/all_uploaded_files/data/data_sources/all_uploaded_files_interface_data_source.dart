import 'package:dio/dio.dart';

abstract class AllUploadedFilesInterfaceDataSource {
  Future<Response> getAllUploadedFiles();
}