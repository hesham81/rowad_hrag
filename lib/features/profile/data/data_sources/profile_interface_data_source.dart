import 'package:dio/dio.dart';

abstract class ProfilesInterfaceDataSource {
  Future<Response> getProfileData();
}
