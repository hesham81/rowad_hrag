part of 'files_cubit.dart';


abstract class FilesState {}

class FilesInitial extends FilesState {}

class FilesLoaded extends FilesState {
  final List<UploadedFilesDataModel> files;

  FilesLoaded({required this.files});
}

class FilesError extends FilesState {
  final String message;

  FilesError({required this.message});
}