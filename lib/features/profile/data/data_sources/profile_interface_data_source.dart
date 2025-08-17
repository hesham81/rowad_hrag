import 'package:dio/dio.dart';

abstract class ProfilesInterfaceDataSource {
  Future<Response> getProfileData();

  Future<Response> getAllAdds();

  Future<Response> getAllPoints();

  Future<Response> deleteAccount();
}
