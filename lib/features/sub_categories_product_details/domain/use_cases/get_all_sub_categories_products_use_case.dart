import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/domain/repositories/sub_categories_products_repositories.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/sub_categories_products_data_model.dart';

class GetAllSubCategoriesProductsUseCase {
  late final SubCategoriesProductsRepositories
      _subCategoriesProductsRepositories;

  GetAllSubCategoriesProductsUseCase(
    this._subCategoriesProductsRepositories,
  );

  Future<Either<Failure, List<SubCategoriesProductsDataModel>>> call(
      String id) async {
    return await _subCategoriesProductsRepositories
        .getAllSubCategoriesProductDetails(id);
  }
}
