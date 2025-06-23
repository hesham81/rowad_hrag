import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/profile/data/models/seller_profile_data_model.dart';
import 'package:rowad_hrag/features/profile/domain/repositories/profile_repositories.dart';

class GetProfileDataUseCase {
  final ProfileRepositories _profileRepositories;

  GetProfileDataUseCase(this._profileRepositories);

  Future<Either<Failure, SellerProfileDataModel>> call() async =>
      await _profileRepositories.getProfileData();
}
