import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '/core/services/web_services.dart';
import '/features/auth/data/data_sources/auth_interface_data_source.dart';
import '/features/auth/data/data_sources/remote_auth_data_source.dart';
import '/features/auth/data/repositories/auth_reposatories_imp.dart';
import '/features/auth/domain/entities/sign_in_request.dart';
import '/features/auth/domain/use_cases/sign_in_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  WebServices _services = WebServices();
  late SignInUseCase _signInUseCase;
  late AuthReposatoriesImp _authReposatoriesImp;
  late AuthInterfaceDataSource _authInterfaceDataSource;

  TextEditingController signInController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  AuthCubit() : super(InitialAuthState());

  Future<bool> signIn() async {
    _authInterfaceDataSource = RemoteAuthDataSource(_services.tokenDio);
    _authReposatoriesImp = AuthReposatoriesImp(_authInterfaceDataSource);
    _signInUseCase = SignInUseCase(_authReposatoriesImp);
    var data = SignInRequest.fromJson(
      {
        "email": signInController.text,
        "password": signInPasswordController.text,
        "login_by": "email",
      },
    );
    EasyLoading.show();
    final response = await _signInUseCase.call(data);
    return response.fold(
      (failed) {
        EasyLoading.dismiss();
        EasyLoading.showError(failed.messageEn ?? "Something Went Wrong");
        return Future.value(false);
      },
      (success) {
        EasyLoading.dismiss();
        _services.myToken = success.accessToken;
        return Future.value(true);
      },
    );
  }
}
