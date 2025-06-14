import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/all_types/data/repositories/all_types_repositories_implementation.dart';
import 'package:rowad_hrag/features/all_types/domain/use_cases/get_all_types_use_case.dart';
import '../../data/data_sources/all_types_interface_data_source.dart';
import '../../data/data_sources/remote_all_types_data_source.dart';
import '../../data/models/all_types_data_model.dart';
import '../../domain/repositories/all_types_repositories.dart';

part 'all_categries_state.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit() : super(AllCategoriesInitial());

  late GetAllTypesUseCase _getAllTypesUseCase;

  late AllTypesInterfaceDataSource _allTypesInterfaceDataSource;

  late AllTypesRepositories _allTypesRepositories;

  late WebServices _services;

  Future<void> getAllCategories() async {
    try {
      _services = WebServices();
      _allTypesInterfaceDataSource =
          RemoteAllTypesDataSource(_services.freePrimaryDio);
      _allTypesRepositories =
          AllTypesRepositoriesImplementation(_allTypesInterfaceDataSource);
      _getAllTypesUseCase = GetAllTypesUseCase(_allTypesRepositories);
      var response = await _getAllTypesUseCase.call();
      response.fold((failure) {
        emit(
          AllCategoriesError(
            failure.messageAr ?? failure.messageEn ?? "حدث خطأ",
          ),
        );
      }, (data) {
        emit(
          AllCategoriesLoaded(
            data,
          ),
        );
      });
    } catch (error) {
      emit(
        AllCategoriesError(
          error.toString(),
        ),
      );
    }
  }
}
