import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/layout/domain/repositories/home_reposatory.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/products_data_model.dart';

class getProductiveFamiliesProductsUseCase {
  final HomeReposatory _homeReposatory;

  getProductiveFamiliesProductsUseCase(this._homeReposatory);

  Future<Either<Failure, List<ProductsDataModel>>> call() async {
    return await _homeReposatory.getProductiveFamiliesProducts();
  }
}
