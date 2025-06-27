import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/auth/data/models/states_data_model.dart';
import '../../../../core/failures/failure.dart';
import '../repositories/product_details_repo.dart';

class GetCityUseCase {
  late final ProductDetailsRepo _productDetailsRepo;

  GetCityUseCase(this._productDetailsRepo);

  Future<Either<Failure, List<StatesDataModel>>> call(int id) async {
    return await _productDetailsRepo.getCities(id);
  }
}
