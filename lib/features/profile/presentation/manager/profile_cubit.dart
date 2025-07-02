import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/profile/data/data_sources/profile_interface_data_source.dart';
import 'package:rowad_hrag/features/profile/data/data_sources/remote_profile_data_source.dart';
import 'package:rowad_hrag/features/profile/data/models/all_adds_data_model.dart';
import 'package:rowad_hrag/features/profile/data/repositories/profile_repositories_implementation.dart';
import 'package:rowad_hrag/features/profile/domain/repositories/profile_repositories.dart';
import 'package:rowad_hrag/features/profile/domain/use_cases/get_profile_data_use_case.dart';
import 'package:rowad_hrag/features/profile/domain/use_cases/get_profile_points_use_case.dart';

import '../../data/models/profile_points_data_model.dart';
import '../../data/models/seller_profile_data_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    getProfileData();
    getAllAdds();
  }

  List<AllAddsDataModel> _adds = [];

  List<AllAddsDataModel> get adds => _adds;
  late ProfilesInterfaceDataSource _dataSource;

  late GetProfileDataUseCase _getProfileDataUseCase;
  late ProfileRepositories _profileRepositories;
  late GetProfilePointsUseCase _getProfilePointsUseCase;
  List<ProfilePointsDataModel> _points = [];

  List<ProfilePointsDataModel> get points => _points;

  int _totalPoints = 0;

  int get totalPoints => _totalPoints;

  late WebServices _services;

  Future<void> getProfileData() async {
    try {
      EasyLoading.show();
      _services = WebServices();
      _dataSource = RemoteProfileDataSource(_services.tokenDio);
      _profileRepositories = ProfileRepositoriesImplementation(_dataSource);
      _getProfileDataUseCase = GetProfileDataUseCase(_profileRepositories);
      var response = await _getProfileDataUseCase.call();
      response.fold((failure) {
        emit(
          ProfileError(
            message: failure.messageEn ?? failure.messageAr ?? " حدث خطأ ما",
          ),
        );
      }, (data) async {
        await _getAllPoints(data);

      });
    } catch (error) {
      emit(
        ProfileError(
          message: error.toString(),
        ),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getAllAdds() async {
    try {
      _services = WebServices();
      _dataSource = RemoteProfileDataSource(_services.tokenDio);
      _profileRepositories = ProfileRepositoriesImplementation(_dataSource);
      var response = await _profileRepositories.getAllAdds();
      response.fold((failure) {
        emit(
          ProfileError(
            message: failure.messageEn ?? failure.messageAr ?? " حدث خطاء ما",
          ),
        );
      }, (data) {
        _adds = data;
      });
    } catch (error) {
      throw Exception(error);
    } finally {}
  }

  Future<void> _getAllPoints(SellerProfileDataModel data) async {
    try {
      _services = WebServices();
      _dataSource = RemoteProfileDataSource(_services.tokenDio);
      _profileRepositories = ProfileRepositoriesImplementation(_dataSource);
      var response = await _profileRepositories.getAllPoints();
      response.fold(
        (l) {
          emit(
            ProfileError(
              message: l.messageEn ?? l.messageAr ?? " حدث خطاء ما",
            ),
          );
        },
        (r) {
          _points = r;
          for (var point in r) {
            _totalPoints += point.points;
          }
          emit(
            ProfileLoaded(
              sellerProfileDataModel: data,
            ),
          );
        },
      );
    } catch (error) {
      emit(
        ProfileError(
          message: error.toString(),
        ),
      );
    }
  }
}
