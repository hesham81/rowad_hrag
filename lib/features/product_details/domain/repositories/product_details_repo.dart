import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/product_details/data/models/product_details_data_model.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetailsDataModel>> getProductDetails(String id);
}
