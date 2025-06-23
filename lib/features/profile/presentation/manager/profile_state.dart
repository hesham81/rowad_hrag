part of 'profile_cubit.dart';

class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final SellerProfileDataModel sellerProfileDataModel;

  ProfileLoaded({required this.sellerProfileDataModel});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}
