import 'package:rowad_hrag/features/layout/domain/entities/category.dart';

class CategoryDataModel extends Category {
  CategoryDataModel({
    required super.id,
    required super.name,
    required super.icon,
    required super.numberOfChildren,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) {
    return CategoryDataModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      numberOfChildren: json['number_of_children'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'number_of_children': numberOfChildren,
    };
  }
}
