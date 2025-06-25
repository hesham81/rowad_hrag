import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/uploaded_files_data_model.dart';
import '../repositories/uploaded_files_repositories.dart';

class GetAllFilesUseCase {
  late UploadedFilesRepositories _uploadedFilesRepositories;

  GetAllFilesUseCase(this._uploadedFilesRepositories);

  Future<Either<Failure, List<UploadedFilesDataModel>>> call() async {
    return await _uploadedFilesRepositories.getAllUploadedFiles();
  }
}
