import 'package:equatable/equatable.dart';
import 'package:rowad_hrag/features/all_types/domain/entities/all_types_children.dart';

class AllTypesEntity extends Equatable {
  final int id;

  final String name;

  final String? icon;

  final String? banner;

  final String slug;


  final DateTime createdAt;

  final DateTime updatedAt;

  final List<AllTypesChildrenEntity> children;

  const AllTypesEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.banner,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.children,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        icon,
        banner,
        slug,
        createdAt,
        updatedAt,
        children,
      ];
}
