// ignore_for_file: unused_import

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/core/services/bot_toast.dart';
import 'package:rowad_hrag/core/services/cash_helper.dart';
import 'package:rowad_hrag/features/auth/domain/entities/sign_up_request.dart';
import 'package:rowad_hrag/features/auth/domain/use_cases/get_city_use_case.dart';
import 'package:rowad_hrag/features/auth/domain/use_cases/get_state_use_case.dart';
import 'package:rowad_hrag/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:rowad_hrag/main.dart';
import '../../data/models/city_data_model.dart';
import '../../data/models/states_data_model.dart';
import '/core/services/web_services.dart';
import '/features/auth/data/data_sources/auth_interface_data_source.dart';
import '/features/auth/data/data_sources/remote_auth_data_source.dart';
import '/features/auth/data/repositories/auth_reposatories_imp.dart';
import '/features/auth/domain/entities/sign_in_request.dart';
import '/features/auth/domain/use_cases/sign_in_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with ChangeNotifier {
  final WebServices _services = WebServices();
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

  var signUpFormKey = GlobalKey<FormState>();

  //
  //  String? _selectedType ;
  //
  // final  setSelectedType = ValueNotifier<String>(_selectedType);

  // get selectedType => _selectedType;

  AuthCubit() : super(InitialAuthState());

  StatesDataModel? _selectedState;

  StatesDataModel? get selectedState => _selectedState;

  void setSelectedState(StatesDataModel? value) {
    _selectedState = value;
  }

  CityDataModel? _selectedCity;

  CityDataModel? get selectedCity => _selectedCity;

  List<CityDataModel> _cities = []; // List<CityDataModel>

  List<CityDataModel> get cities => _cities;

  List<StatesDataModel> _states = []; // List<StatesDataModel>

  List<StatesDataModel> get states => _states;

  void setSelectedCity(CityDataModel? value) {
    _selectedCity = value;
    emit(
      SelectedCity(
        _selectedCity!,
      ),
    );
    getStates(_selectedCity!.id);
  }

  String? _selectedGender;

  String? get selectedGender => _selectedGender;

  void setSelectedGender(String? value) {
    _selectedGender = value;
    emit(
      SelectedGender(
        _selectedGender!,
      ),
    );
  }

  Future<void> getStates(int cityId) async {
    EasyLoading.show();
    try {
      _authInterfaceDataSource = RemoteAuthDataSource(_services.freePrimaryDio);
      _authReposatoriesImp = AuthReposatoriesImp(_authInterfaceDataSource);
      _getStateUseCase = GetStateUseCase(_authReposatoriesImp);
      final response = await _getStateUseCase.call(cityId);
      return response.fold((error) {
        emit(
          ErrorSignUp(
            error.messageEn ?? error.messageAr ?? "حدث خطاء ما",
          ),
        );
      }, (states) {
        _states = states;
        emit(
          CompletedStateLoaded(states),
        );
      });
    } catch (error) {
      emit(
        ErrorSignUp(
          error.toString(),
        ),
      );
    } finally {
      EasyLoading.dismiss();
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
    try {
      final response = await _signInUseCase.call(data);
      return response.fold(
        (failed) {
          BotToastServices.showErrorMessage(failed.messageEn ?? "حدث خطاء ما");
          return Future.value(false);
        },
        (success) {
          _services.myToken = success.accessToken;
          CashHelper.setString("token", success.accessToken);
          return Future.value(true);
        },
      );
    } catch (error) {
      BotToastServices.showErrorMessage(error.toString());
      return Future.value(false);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getAllCities() async {
    EasyLoading.show();
    _authInterfaceDataSource = RemoteAuthDataSource(_services.freePrimaryDio);
    _authReposatoriesImp = AuthReposatoriesImp(_authInterfaceDataSource);
    _getCityUseCase = GetCityUseCase(_authReposatoriesImp);
    try {
      final response = await _getCityUseCase.call();
      return response.fold(
        (error) {
          BotToastServices.showErrorMessage(error.messageEn ?? "حدث خطاء ما");
          emit(
            ErrorSignUp(
              error.messageEn ?? error.messageAr ?? "حدث خطاء ما",
            ),
          );
        },
        (cities) async {
          _cities = cities;
          emit(
            CompletedCityLoaded(
              cities,
            ),
          );
          await CashHelper.setStringList(
            "Cities",
            cities
                .map(
                  (e) => e.name,
                )
                .toList(),
          );
        },
      );
    } catch (error) {
      emit(
        ErrorSignUp(
          error.toString(),
        ),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  // sex: _selectedGender ?? "male",

  Future<void> signUp(BuildContext context) async {
    try {
      _authInterfaceDataSource = RemoteAuthDataSource(_services.freePrimaryDio);
      _authReposatoriesImp = AuthReposatoriesImp(_authInterfaceDataSource);
      _signUpUseCase = SignUpUseCase(_authReposatoriesImp);

      EasyLoading.show();

      var data = SignUpRequest(
        name: signUpNameController.text,
        emailOrPhone: signUpEmailController.text,
        sex: _selectedGender ?? "male",
        stateId: "3147",
        // TODO: Replace with dynamic value
        cityId: "4001",
        // TODO: Replace with dynamic value
        password: signUpPasswordController.text,
        confirmPassword: signUpConfirmPasswordController.text,
        loginBy: "email",
      );

      var response = await _signUpUseCase.call(data);

      response.fold(
        (l) {
          BotToastServices.showErrorMessage(
            l.messageEn ?? "Something Went Wrong",
          );
          emit(ErrorSignUp(l.messageEn ?? l.messageAr ?? "حدث خطأ ما"));
          print("Sign Up Failed: ${l.messageEn} | ${l.messageAr}");
        },
        (r) {
          BotToastServices.showSuccessMessage("Sign Up Successful");
          CashHelper.setString("token", r);
          print("Navigating to Home Screen...");
          Navigator.pop(context);
        },
      );
    } catch (error) {
      emit(ErrorSignUp(error.toString()));
      print("Unexpected Error During Sign Up: $error");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
