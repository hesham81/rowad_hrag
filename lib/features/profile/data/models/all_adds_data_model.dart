import 'package:rowad_hrag/features/profile/domain/entities/all_adds.dart';

class AllAddsDataModel extends AllAddsEntity {
  const AllAddsDataModel({
    required super.id,
    required super.fileName,
    required super.imageUrl,
    required super.type,
    required super.fileOriginalName,
  });

  factory AllAddsDataModel.fromJson(Map<String, dynamic> json) {
    return AllAddsDataModel(
      fileOriginalName: json['file_original_name'],
      id: json['id'],
      fileName: json['file_name'],
      imageUrl: json['url'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'file_name': fileName,
        'url': imageUrl,
        'type': type,
        'file_original_name': fileOriginalName,
      };
}
