import 'package:equatable/equatable.dart';

class TopSellers extends Equatable {
  final int id;

  final String slug;

  final String name;

  final String logo;

  final double rating;

  const TopSellers({
    required this.id,
    required this.slug,
    required this.name,
    required this.logo,
    required this.rating,
  });

  @override
  List<Object?> get props => [
        id,
        slug,
        name,
        logo,
        rating,
      ];
}
