import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/data/data_sources/remote_sub_categories_products_data_source.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/data/data_sources/sub_categories_product_details_interface_data_source.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/data/repositories/sub_categories_products_repositories_implementation.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/domain/use_cases/get_all_sub_categories_products_use_case.dart';

import '../../data/models/sub_categories_products_data_model.dart';
import '../../domain/repositories/sub_categories_products_repositories.dart';

part 'cub_categories_product_state.dart';

class SubCategoriesProductCubit extends Cubit<SubCategoriesProductState> {
  SubCategoriesProductCubit() : super(SubCategoriesProductInitial());

  late GetAllSubCategoriesProductsUseCase _allSubCategoriesProductsUseCase;

  late SubCategoriesProductsRepositories _subCategoriesProductsRepositories;

  late SubCategoriesProductDetailsInterfaceDataSource _dataSource;

  late WebServices _services;

  Future<void> getAllSubCategoriesProductDetails(String id) async {
    try {
      _services = WebServices();
      _dataSource =
          RemoteSubCategoriesProductsDataSource(_services.freePrimaryDio);
      _subCategoriesProductsRepositories =
          SubCategoriesProductsRepositoriesImplementation(_dataSource);
      _allSubCategoriesProductsUseCase = GetAllSubCategoriesProductsUseCase(
        _subCategoriesProductsRepositories,
      );

      var response = await _allSubCategoriesProductsUseCase.call(id);
      response.fold((failure) {
        emit(
          SubCategoriesProductError(
              failure.messageEn ?? failure.messageAr ?? "حدث خطأ ما"),
        );
      }, (subCategoriesProducts) {
        emit(SubCategoriesProductSuccess(subCategoriesProducts));
      });
    } catch (error) {
      emit(
        SubCategoriesProductError(
          error.toString(),
        ),
      );
    }
  }
}
