import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/data/data_sources/sub_categories_product_details_interface_data_source.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/data/models/sub_categories_products_data_model.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/domain/repositories/sub_categories_products_repositories.dart';

class SubCategoriesProductsRepositoriesImplementation
    implements SubCategoriesProductsRepositories {
  late SubCategoriesProductDetailsInterfaceDataSource _dataSource;

  SubCategoriesProductsRepositoriesImplementation(this._dataSource);

  @override
  Future<Either<Failure, List<SubCategoriesProductsDataModel>>>
      getAllSubCategoriesProductDetails(String id) async {
    try {
      final response = await _dataSource.getAllSubCategoriesProductDetails(id);

      List<SubCategoriesProductsDataModel> subCategoriesProducts =
          List.from(response.data['data'])
              .map(
                (e) => SubCategoriesProductsDataModel.fromJson(e),
              )
              .toList();
      return Right(subCategoriesProducts);
    } catch (error) {
      throw Exception(error);
    }
  }
}
