import 'package:rowad_hrag/features/product_details/domain/entities/shop.dart';

class ShopDataModel extends Shop {
  ShopDataModel({
    required super.id,
    required super.name,
    required super.logo,
    required super.phone,
    required super.address,
    required super.numberOfReviews,
    required super.rating,
    required super.slug,
    required super.description,
    required super.commission,
  });

  factory ShopDataModel.fromJson(Map<String, dynamic> json) {
    return ShopDataModel(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      phone: json['phone'],
      address: json['address'],
      numberOfReviews: json['number_of_reviews'],
      rating: (json['rating'] is num) ? json['rating'].toDouble() : 0.0,
      slug: json['slug'],
      description: json['meta_description'],
      commission: json['commission'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'logo': logo,
        'phone': phone,
        'address': address,
        'number_of_reviews': numberOfReviews,
        'rating': rating,
        'slug': slug,
        'description': description,
        'commission': commission,
      };
}
