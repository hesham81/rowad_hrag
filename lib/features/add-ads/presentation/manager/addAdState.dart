part of 'addAdCubit.dart';

class AddState {}

class AddInitial extends AddState {}

class AddLoading extends AddState {}

class AddSuccess extends AddState {
  late AddAdsResponseDataModel data;

  AddSuccess({required this.data});
}

class AddError extends AddState {
  String error;

  AddError({required this.error});
}
