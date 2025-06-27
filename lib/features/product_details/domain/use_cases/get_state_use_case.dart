import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../auth/data/models/city_data_model.dart';
import '../repositories/product_details_repo.dart';

class GetStatesUseCase {
  final ProductDetailsRepo _productDetailsRepo;
  GetStatesUseCase(this._productDetailsRepo);
  Future<Either<Failure, List<CityDataModel>>> call(int id) async=>
      _productDetailsRepo.getStates();
}