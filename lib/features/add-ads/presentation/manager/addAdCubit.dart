import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/add-ads/data/data_sources/add_ads_interface_data_source.dart';
import 'package:rowad_hrag/features/add-ads/data/data_sources/add_ads_remote_data_source.dart';
import 'package:rowad_hrag/features/add-ads/data/repositories/add_ads_repositories_implementation.dart';
import 'package:rowad_hrag/features/add-ads/domain/repositories/add_ads_repositories.dart';
import 'package:rowad_hrag/features/add-ads/domain/use_cases/add_new_ad_use_case.dart';
import 'package:rowad_hrag/features/add-ads/domain/use_cases/get_city_use_case.dart';
import 'package:rowad_hrag/features/add-ads/domain/use_cases/get_state_use_case.dart';
import 'package:rowad_hrag/features/auth/data/models/city_data_model.dart';
import 'package:rowad_hrag/features/auth/data/models/states_data_model.dart';

import '../../../../core/services/cash_helper.dart';
import '../../data/models/add_ads_data_model.dart';
import '../../data/models/add_ads_response_data_model.dart';

part 'addAdState.dart';

class AddAdCubit extends Cubit<AddState> {
  AddAdCubit() : super(AddInitial()) {
    Future.wait([
      getAllCities(),
    ]);
  }

  late AddNewAdUseCase _addNewAdUseCase;

  late AddAdsRepositories _addAdsRepositories;

  late AddAdsInterfaceDataSource _interfaceDataSource;

  late WebServices _services;

  List<CityDataModel> cities = [];

  List<StatesDataModel> states = [];

  Future<void> addNewAd(AddAdsDataModel ad) async {
    try {
      EasyLoading.show();
      _services = WebServices();
      _interfaceDataSource = AddAdsRemoteDataSource(_services.tokenDio);
      _addAdsRepositories =
          AddAdsRepsitoriesImplementation(_interfaceDataSource);
      _addNewAdUseCase = AddNewAdUseCase(_addAdsRepositories);
      var response = await _addNewAdUseCase.call(ad);
      response.fold(
          (failure) => emit(
                AddError(
                  error: failure.messageEn ?? failure.messageAr ?? "حدث خطأ ما",
                ),
              ), (model) {
        emit(
          AddSuccess(
            data: model,
          ),
        );
      });
    } catch (error) {
      emit(
        AddError(
          error: error.toString(),
        ),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  late GetCityUseCase _getCityUseCase;

  Future<void> getAllCities() async {
    try {
      _services = WebServices();
      _interfaceDataSource = AddAdsRemoteDataSource(_services.tokenDio);
      _addAdsRepositories =
          AddAdsRepsitoriesImplementation(_interfaceDataSource);
      _getCityUseCase = GetCityUseCase(_addAdsRepositories);
      final response = await _getCityUseCase.call();
      return response.fold(
        (error) {
          EasyLoading.showError(
            error.messageEn ?? error.messageAr ?? "حدث خطاء ما",
          );
        },
        (city) {
          cities = city;
        },
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  late final GetStateUseCase _getStateUseCase;

  Future<void> getState(int cityId) async {
    try {
      _services = WebServices();
      _interfaceDataSource = AddAdsRemoteDataSource(_services.tokenDio);
      _addAdsRepositories =
          AddAdsRepsitoriesImplementation(_interfaceDataSource);
      _getStateUseCase = GetStateUseCase(_addAdsRepositories);
      final response = await _getStateUseCase.call(cityId);
      return response.fold(
        (error) {
          EasyLoading.showError(
            error.messageEn ?? error.messageAr ?? "حدث خطاء ما",
          );
        },
        (state) {
          states = state;
        },
      );
    } catch (error) {
      throw Exception(error);
    }
  }
}
