part of 'plans_cubit.dart';

class PlansInitialState {}


class PlansErrorState extends PlansInitialState {
  final String message;
  PlansErrorState(this.message);
}

class PlansLoadedState extends PlansInitialState {
  final List<PlansDataModel> plans;
  PlansLoadedState(this.plans);
}

class PaymentSuccessState extends PlansInitialState {
  final String message;
  PaymentSuccessState(this.message);
}

class PaymentErrorState extends PlansInitialState {
  final String message;
  PaymentErrorState(this.message);
}