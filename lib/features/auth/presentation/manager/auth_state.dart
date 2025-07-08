part of "auth_cubit.dart";

sealed class AuthState {
  const AuthState();
}

class HandlingAuth extends AuthState {}

class InitialAuthState extends HandlingAuth {}

class CompletedCityLoaded extends HandlingAuth {
  final List<CityDataModel> cities;

  CompletedCityLoaded(this.cities);
}

class CompletedStateLoaded extends HandlingAuth {
  final List<StatesDataModel> states;

  CompletedStateLoaded(this.states);
}

class ErrorSignUp extends HandlingAuth {
  final String message;
  ErrorSignUp(this.message);
}
