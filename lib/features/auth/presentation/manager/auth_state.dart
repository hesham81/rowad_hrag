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
class SelectedGender extends HandlingAuth {
  final String gender;
  SelectedGender(this.gender);
}
class SelectedState extends HandlingAuth {
  final StatesDataModel state;
  SelectedState(this.state);
}
class SelectedCity extends HandlingAuth {
  final CityDataModel city;
  SelectedCity(this.city);
}



