import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/all_uploaded_files/data/data_sources/all_uploaded_files_interface_data_source.dart';
import 'package:rowad_hrag/features/all_uploaded_files/data/data_sources/all_uploaded_files_remote_data_source.dart';
import 'package:rowad_hrag/features/all_uploaded_files/data/repositories/uploaded_files_repositories_implementation.dart';
import 'package:rowad_hrag/features/all_uploaded_files/domain/repositories/uploaded_files_repositories.dart';
import 'package:rowad_hrag/features/all_uploaded_files/domain/use_cases/get_all_files_use_case.dart';

import '../../data/models/uploaded_files_data_model.dart';

part 'files_state.dart';

class FilesCubit extends Cubit<FilesState> {
  FilesCubit() : super(FilesInitial());

  late GetAllFilesUseCase _allFilesUseCase;

  late UploadedFilesRepositories _uploadedFilesRepositories;

  late AllUploadedFilesInterfaceDataSource _dataSource;
  late WebServices _services;

  Future<void> getAllFiles() async {
    try {
      _services = WebServices();
      _dataSource = AllUploadedFilesRemoteDataSource(_services.tokenDio);
      _uploadedFilesRepositories =
          UploadedFilesRepositoriesImplementation(_dataSource);
      _allFilesUseCase = GetAllFilesUseCase(_uploadedFilesRepositories);

      var response = await _allFilesUseCase.call();
      response.fold((failure) {
        emit(
          FilesError(
            message: failure.messageAr ?? failure.messageEn ?? "حدث خطأ ما",
          ),
        );
      }, (data) {
        emit(FilesLoaded(files: data));
      });
    } catch (error) {
      emit(
        FilesError(
          message: error.toString(),
        ),
      );
    }
  }
}
