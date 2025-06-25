import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/adds_reviews/data/data_sources/adds_reviews_interface_data_source.dart';
import 'package:rowad_hrag/features/adds_reviews/domain/use_cases/get_all_adds_reviews_use_case.dart';

import '../../data/data_sources/adds_reviews_remote_data_source.dart';
import '../../data/models/adds_reviews_data_model.dart';
import '../../data/repositories/adds_reviews_repositories_implementation.dart';
import '../../domain/repositories/adds_reviews_repositories.dart';

part 'adds_reviews_state.dart';

class AddsReviewsCubit extends Cubit<AddsReviewsState> {
  AddsReviewsCubit() : super(AddsReviewsInitial());

  late AddsReviewsInterfaceDataSource _dataSource;

  late GetAllAddsReviewsUseCase _getAllAddsReviewsUseCase;

  late AddReviewsRepositories _addReviewsRepositories;
  late WebServices _services;

  Future<void> getAllAddsReviews() async {
    try {
      _services = WebServices();
      _dataSource = AddsReviewsRemoteDataSource(_services.tokenDio);
      _addReviewsRepositories =
          AddsReviewsRepositoriesImplementation(_dataSource);
      _getAllAddsReviewsUseCase =
          GetAllAddsReviewsUseCase(_addReviewsRepositories);
      var response = await _getAllAddsReviewsUseCase.call();

      response.fold((failure) {
        emit(
          ErrorAddsReviewsState(
            failure.messageEn ?? failure.messageAr ?? 'حدث خطأ ما',
          ),
        );
      }, (addsReviews) {
        emit(LoadedAddsReviewsState(addsReviews));
      });
    } catch (error) {
      emit(
        ErrorAddsReviewsState(
          error.toString(),
        ),
      );
    }
  }
}
