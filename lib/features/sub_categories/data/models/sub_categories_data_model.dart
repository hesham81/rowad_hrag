import 'package:rowad_hrag/features/sub_categories/domain/entities/sub_categories.dart';

class SubCategoriesDataModel extends SubCategories {
  SubCategoriesDataModel({
    required super.id,
    required super.slug,
    required super.name,
    required super.banner,
    required super.icon,
    required super.numberOfChildren,
  });

  factory SubCategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      SubCategoriesDataModel(
        id: json["id"],
        slug: json["slug"].toString(),
        name: json["name"].toString(),
        banner: json["banner"].toString(),
        icon: json["icon"].toString(),
        numberOfChildren: json["number_of_children"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'name': name,
        'banner': banner,
        'icon': icon,
        'number_of_children': numberOfChildren,
      };
}
