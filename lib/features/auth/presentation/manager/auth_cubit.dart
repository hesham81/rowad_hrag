import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/cash_helper.dart';
import 'package:rowad_hrag/features/auth/domain/entities/sign_up_request.dart';
import 'package:rowad_hrag/features/auth/domain/use_cases/get_city_use_case.dart';
import 'package:rowad_hrag/features/auth/domain/use_cases/get_state_use_case.dart';
import 'package:rowad_hrag/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:rowad_hrag/main.dart';
import '../../data/models/city_data_model.dart';
import '../../data/models/states_data_model.dart';
import '../../domain/use_cases/sign_up_use_case.dart';
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
  late SignUpUseCase _signUpUseCase;
  late AuthReposatoriesImp _authReposatoriesImp;
  late AuthInterfaceDataSource _authInterfaceDataSource;
  late GetCityUseCase _getCityUseCase;
  late GetStateUseCase _getStateUseCase;

  TextEditingController signInController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
      TextEditingController();

  AuthCubit() : super(InitialAuthState());

  StatesDataModel? _selectedState;

  StatesDataModel? get selectedState => _selectedState;

  void setSelectedState(StatesDataModel? value) {
    _selectedState = value;
  }

  CityDataModel? _selectedCity;

  CityDataModel? get selectedCity => _selectedCity;

  void setSelectedCity(CityDataModel? value) {
    _selectedCity = value;
    getStates(_selectedCity!.id);
  }

  Future<void> getStates(int cityId) async {
    try {
      _authInterfaceDataSource = RemoteAuthDataSource(_services.freePrimaryDio);
      _authReposatoriesImp = AuthReposatoriesImp(_authInterfaceDataSource);
      _getStateUseCase = GetStateUseCase(_authReposatoriesImp);
      final response = await _getStateUseCase.call(cityId);
      return response.fold((error) {
        throw Exception(error.messageEn);
      }, (states) {
        return emit(
          CompletedStateLoaded(states),
        );
      });
    } catch (error) {
      throw Exception(error);
    }
  }

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

  Future<void> getAllCities() async {
    _authInterfaceDataSource = RemoteAuthDataSource(_services.freePrimaryDio);
    _authReposatoriesImp = AuthReposatoriesImp(_authInterfaceDataSource);
    _getCityUseCase = GetCityUseCase(_authReposatoriesImp);
    try {
      final response = await _getCityUseCase.call();
      return response.fold(
        (error) {
          throw Exception(error.messageEn);
        },
        (cities) async {
          await CashHelper.setStringList(
            "Cities",
            cities
                .map(
                  (e) => e.name,
                )
                .toList(),
          );
          emit(
            CompletedCityLoaded(cities),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> signUp() async {
    try {
      _authInterfaceDataSource = RemoteAuthDataSource(_services.freePrimaryDio);
      _authReposatoriesImp = AuthReposatoriesImp(_authInterfaceDataSource);
      _signUpUseCase = SignUpUseCase(_authReposatoriesImp);
      EasyLoading.show();
      var data = SignUpRequest(
        name: signUpNameController.text,
        emailOrPhone: signUpEmailController.text,
        sex: 'male',
        stateId: '3147',
        cityId: "4001",
        password: signUpPasswordController.text,
        confirmPassword: signUpConfirmPasswordController.text,
        loginBy: "email",
      );
      var response = await _signUpUseCase.call(data);
      return response.fold(
        (l) {
          EasyLoading.dismiss();
          return false;
        },
        (r) {
          EasyLoading.dismiss();
          navigationKey.currentState!.pushNamed(
            RouteNames.home,
          );
          _services.myToken = r.accessToken;
          return true;
        },
      );
    } catch (error) {
      EasyLoading.dismiss();
      return false;
    }
  }
}
