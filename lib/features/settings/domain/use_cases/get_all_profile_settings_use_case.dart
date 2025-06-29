import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/settings/domain/repositories/settings_reposatories.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/settings_data_model.dart';

class GetAllProfileSettingsUseCase {
  late final SettingsReposatories _settingsReposatories;

  GetAllProfileSettingsUseCase(this._settingsReposatories);

  Future<Either<Failure, List<SettingsDataModel>>> call() async =>
      await _settingsReposatories.getHomeSettings();
}
