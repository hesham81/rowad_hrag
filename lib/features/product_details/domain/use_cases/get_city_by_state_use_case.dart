import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/auth/data/models/states_data_model.dart';
import '../../../../core/failures/failure.dart';
import '../repositories/product_details_repo.dart';

class GetCityByStateUseCase {
  late final ProductDetailsRepo _repo;

  GetCityByStateUseCase(this._repo);

  Future<Either<Failure, List<StatesDataModel>>> call(int id) async {
    return await _repo.getCityById(id);
  }
}
