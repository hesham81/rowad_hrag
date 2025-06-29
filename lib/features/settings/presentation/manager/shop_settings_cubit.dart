import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/settings/data/data_sources/remote_settings_interface_data_source.dart';
import 'package:rowad_hrag/features/settings/data/repositories/settings_reposatories_implementation.dart';
import 'package:rowad_hrag/features/settings/domain/use_cases/get_all_profile_settings_use_case.dart';

import '../../data/data_sources/home_settings_interface_data_source.dart';
import '../../data/models/settings_data_model.dart';
import '../../domain/repositories/settings_reposatories.dart';

part 'shop_settings_state.dart';

class ShopSettingsCubit extends Cubit<ShopSettingsState> {
  ShopSettingsCubit() : super(ShopSettingsInitial());

  late GetAllProfileSettingsUseCase _settingsUseCase;
  late SettingsReposatories _settingsReposatories;
  late HomeSettingsInterfaceDataSource _interfaceDataSource;
  late WebServices _services;

  Future<void> getAllSettings() async {
    try {
      _services = WebServices();
      _interfaceDataSource =
          RemoteSettingsInterfaceDataSource(_services.tokenDio);
      _settingsReposatories =
          SettingsReposatoriesImplementation(_interfaceDataSource);
      _settingsUseCase = GetAllProfileSettingsUseCase(_settingsReposatories);

      var response = await _settingsUseCase.call();
      response.fold(
        (error) {
          emit(
            ShopSettingsErrorState(
              error.messageAr ?? error.messageEn ?? "Error",
            ),
          );
        },
        (data) {
          emit(
            ShopSettingsLoadedState(
              data,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        ShopSettingsErrorState(
          e.toString(),
        ),
      );
    }
  }
}
