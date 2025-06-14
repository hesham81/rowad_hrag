import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/product_details/data/models/product_details_data_model.dart';
import 'package:rowad_hrag/features/product_details/domain/repositories/product_details_repo.dart';

class GetProductDetailsUseCase {
  final ProductDetailsRepo _productDetailsRepo;

  GetProductDetailsUseCase(this._productDetailsRepo);

  Future<Either<Failure, ProductDetailsDataModel>> call(String id) async {
    return await _productDetailsRepo.getProductDetails(id);
  }
}
