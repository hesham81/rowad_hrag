import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/settings/domain/repositories/settings_reposatories.dart';

import '../../../../core/failures/failure.dart';
import '../entities/update_profile_settings_response.dart';

class UpdateProfileSettingsUseCase {
  late final SettingsReposatories _settingsReposatories;

  UpdateProfileSettingsUseCase(this._settingsReposatories);

  Future<Either<Failure, UpdateProfileSettingsResponse>> call() async =>
      await _settingsReposatories.updateSettings();
}
