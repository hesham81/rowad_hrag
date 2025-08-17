import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/profile/data/models/all_adds_data_model.dart';
import 'package:rowad_hrag/features/profile/data/models/profile_points_data_model.dart';
import 'package:rowad_hrag/features/profile/data/models/seller_profile_data_model.dart';
import 'package:rowad_hrag/features/profile/domain/entities/all_adds.dart';

import '../../../../core/failures/failure.dart';

abstract class ProfileRepositories {
  Future<Either<Failure, SellerProfileDataModel>> getProfileData();

  Future<Either<Failure, List<AllAddsDataModel>>> getAllAdds();

  Future<Either<Failure, List<ProfilePointsDataModel>>> getAllPoints();

  Future<Either<Failure, String>> deleteAccount();
}
