import 'package:equatable/equatable.dart';

class AllTypesChildrenEntity extends Equatable {
  final int id;

  final int parentId;

  final int level;

  final String name;

  final String slug;

  const AllTypesChildrenEntity({
    required this.id,
    required this.parentId,
    required this.level,
    required this.name,
    required this.slug,
  });

  @override
  List<Object?> get props => [
        id,
        parentId,
        level,
        name,
        slug,
      ];
}
