import 'package:rowad_hrag/features/all_uploaded_files/domain/entities/uploaded_files.dart';

class UploadedFilesDataModel extends UploadedFiles {
  UploadedFilesDataModel({
    required super.id,
    required super.image,
    required super.fileName,
  });

  factory UploadedFilesDataModel.fromJson(Map<String, dynamic> json) {
    return UploadedFilesDataModel(
      id: json['id'],
      image: json['url'],
      fileName: json['file_original_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': image,
        'file_original_name': fileName,
      };
}
