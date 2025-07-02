part of 'shop_settings_cubit.dart';

class ShopSettingsState {}

class ShopSettingsInitial extends ShopSettingsState {}

class UpdateShopSettingsState extends ShopSettingsState {}

class ShopSettingsLoadingState extends ShopSettingsState {}

class ShopSettingsErrorState extends ShopSettingsState {
  final String errorMessage;

  ShopSettingsErrorState(this.errorMessage);
}

class ShopSettingsLoadedState extends ShopSettingsState {
  final List<SettingsDataModel> settings;

  ShopSettingsLoadedState(this.settings);
}
