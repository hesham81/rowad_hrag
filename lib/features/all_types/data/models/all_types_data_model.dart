import 'package:rowad_hrag/features/all_types/data/models/all_types_children_data_model.dart';
import 'package:rowad_hrag/features/all_types/domain/entities/all_types_entity.dart';

class AllTypesDataModel extends AllTypesEntity {
  const AllTypesDataModel({
    required super.id,
    required super.name,
    required super.icon,
    required super.banner,
    required super.slug,
    required super.createdAt,
    required super.updatedAt,
    required super.children,
  });

  factory AllTypesDataModel.fromJson(Map<String, dynamic> json) {
    return AllTypesDataModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      banner: json['banner'],
      slug: json['slug'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      children: List.from(json['children_categories'])
          .map(
            (e) => AllTypesChildrenDataModel.fromJson(e),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'banner': banner,
      'slug': slug,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'children_categories': children,
    };
  }
}
