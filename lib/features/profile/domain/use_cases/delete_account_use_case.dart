import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../repositories/profile_repositories.dart';

class DeleteAccountUseCase {
  late final ProfileRepositories _profileRepositories;

  DeleteAccountUseCase(this._profileRepositories);

  Future<Either<Failure, String>> call() async =>
      await _profileRepositories.deleteAccount();
}
