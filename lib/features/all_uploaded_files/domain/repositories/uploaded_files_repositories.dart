import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/features/all_uploaded_files/data/models/uploaded_files_data_model.dart';

import '../../../../core/failures/failure.dart';

abstract class UploadedFilesRepositories {

  Future<Either<Failure, List<UploadedFilesDataModel>>> getAllUploadedFiles();
}