import 'package:equatable/equatable.dart';

class SubCategoriesProducts extends Equatable {
  final int id;

  final String slug;

  final String name;

  final String image;

  final String price;

  final double rating;

  const SubCategoriesProducts({
    required this.name,
    required this.id,
    required this.slug,
    required this.image,
    required this.price,
    required this.rating,
  });

  @override
  List<Object?> get props => [
        id,
        slug,
        image,
        price,
        name,
        rating,
      ];
}
