import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/auth/data/models/city_data_model.dart';
import 'package:rowad_hrag/features/product_details/domain/repositories/product_details_repo.dart';

import '../../../../core/failures/failure.dart';
import '../../../auth/data/models/states_data_model.dart';

class GetStatesUseCase {
  late final ProductDetailsRepo _productDetailsRepo;

  GetStatesUseCase(this._productDetailsRepo);

  Future<Either<Failure, CityDataModel>> getState(int id) async {
    return await _productDetailsRepo.getState(id);
  }
}
