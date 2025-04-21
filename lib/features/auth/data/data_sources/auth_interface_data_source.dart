import 'package:dio/dio.dart';
import 'package:rowad_hrag/features/auth/data/models/sign_up_data_model.dart';
import 'package:rowad_hrag/features/auth/domain/entities/sign_in_request.dart';

import '../../domain/entities/sign_up_request.dart';

abstract class AuthInterfaceDataSource {
  Future<Response> signIn(SignInRequest data);

  Future<Response> signUp(SignUpDataModel data) ;

  Future<Response> forgetPassword();
}
