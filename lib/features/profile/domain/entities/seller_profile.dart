import 'package:equatable/equatable.dart';

class SellerProfile extends Equatable {
  final String name;

  final String email;

  final String? phone;

  // final String type;

  final String image;

  final int id;

  final double rating;
  //
  final bool verified;

  final String verifiedImg;

  final int products;

  final int orders;

  final String sales;

  final String? description;

  final String? title;

  const SellerProfile({
    required this.rating,
    required this.verified,
    required this.verifiedImg,
    required this.products,
    required this.orders,
    required this.sales,
    required this.description,
    required this.title,
    required this.name,
    required this.email,
    this.phone,
    // required this.type,
    required this.image,
    required this.id,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        // type,
        image,
        id,
        rating,
        verified,
        verifiedImg,
        products,
        orders,
        sales,
        description,
        title,
      ];
}
