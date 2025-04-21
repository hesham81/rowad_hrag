part of "auth_cubit.dart";

abstract class AuthState {
  const AuthState();
}

class InitialAuthState extends AuthState {}

class CompletedCityLoaded extends AuthState {
  final List<CityDataModel> cities;

  CompletedCityLoaded(this.cities);
}
