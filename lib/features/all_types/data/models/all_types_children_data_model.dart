import 'package:rowad_hrag/features/all_types/domain/entities/all_types_children.dart';

class AllTypesChildrenDataModel extends AllTypesChildrenEntity {
  AllTypesChildrenDataModel({
    required super.id,
    required super.parentId,
    required super.level,
    required super.name,
    required super.slug,
  });

  factory AllTypesChildrenDataModel.fromJson(Map<String, dynamic> json) =>
      AllTypesChildrenDataModel(
        id: json['id'],
        parentId: json['parent_id'],
        level: json['level'],
        name: json['name'],
        slug: json['slug'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'parent_id': parentId,
        'level': level,
        'name': name,
        'slug': slug,
      };
}
