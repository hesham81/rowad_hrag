import 'package:equatable/equatable.dart';

class Shop extends Equatable {
  final int id;

  final String name;

  final String logo;

  final String phone;

  final String address;

  final int numberOfReviews;

  final double rating;

  final String slug;

  final String description;

  final double commission;

  Shop({
    required this.id,
    required this.name,
    required this.logo,
    required this.phone,
    required this.address,
    required this.numberOfReviews,
    required this.rating,
    required this.slug,
    required this.description,
    required this.commission,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        logo,
        phone,
        address,
        numberOfReviews,
        rating,
        slug,
        description,
        commission,
      ];
}
