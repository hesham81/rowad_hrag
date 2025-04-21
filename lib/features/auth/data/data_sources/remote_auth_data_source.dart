import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rowad_hrag/core/constant/api_networks.dart';
import 'package:rowad_hrag/features/auth/data/data_sources/auth_interface_data_source.dart';
import 'package:rowad_hrag/features/auth/data/models/sign_up_data_model.dart';
import 'package:rowad_hrag/features/auth/domain/entities/sign_in_request.dart';

import '../../domain/entities/sign_up_request.dart';

class RemoteAuthDataSource implements AuthInterfaceDataSource {
  Dio _dio;

  RemoteAuthDataSource(this._dio);

  @override
  Future<Response> forgetPassword() {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Response> signIn(SignInRequest data) async {
    return await _dio.post(
      ApiEndPoints.login,
      data: data.toJson(),
    );
  }

  @override
  Future<Response> signUp(SignUpDataModel data)  async{
    return await _dio.post(
      ApiEndPoints.login,
      data: data.toJson(),
    );
  }
}
