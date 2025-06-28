import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/data/models/sub_categories_products_data_model.dart';

import '../../../../core/failures/failure.dart';

abstract class SubCategoriesProductsRepositories {
  Future<Either<Failure, List<SubCategoriesProductsDataModel>>>
      getAllSubCategoriesProductDetails(String id);
}
