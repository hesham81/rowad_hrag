import 'package:equatable/equatable.dart';

class Blog extends Equatable {
  final int id;
  final int categoryId;
  final String title;
  final String slug;

  final String shDescription;

  final String descrption;

  final int banner;

  final DateTime createdAt;

  Blog({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.slug,
    required this.shDescription,
    required this.descrption,
    required this.banner,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        categoryId,
        title,
        slug,
        shDescription,
        descrption,
        banner,
        createdAt,
      ];
}
