import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/product_details/domain/repositories/product_details_repo.dart';

import '../../../../core/failures/failure.dart';
import '../../data/repositories/product_details_repositories_imp.dart';

class PayToProductDetailsUseCase {
  final ProductDetailsRepo _productDetailsRepo;

  PayToProductDetailsUseCase(this._productDetailsRepo);

  Future<Either<Failure, String>> call(double amount) async =>
      await _productDetailsRepo.payToProduct(amount);
}
