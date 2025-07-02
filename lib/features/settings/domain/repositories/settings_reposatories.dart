import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/settings/data/models/settings_data_model.dart';

abstract class SettingsReposatories {
  Future<Either<Failure, List<SettingsDataModel>>> getHomeSettings();
}
