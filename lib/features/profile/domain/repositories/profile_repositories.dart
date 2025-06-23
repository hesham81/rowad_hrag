import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/profile/data/models/seller_profile_data_model.dart';

import '../../../../core/failures/failure.dart';

abstract class ProfileRepositories {
  Future<Either<Failure, SellerProfileDataModel>> getProfileData();
}
