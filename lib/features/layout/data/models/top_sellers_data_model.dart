import 'package:rowad_hrag/features/layout/domain/entities/top_sellers.dart';

class TopSellersDataModel extends TopSellers {
  const TopSellersDataModel({
    required super.id,
    required super.slug,
    required super.name,
    required super.logo,
    required super.rating,
  });

  factory TopSellersDataModel.fromJson(Map<String, dynamic> json) {
    return TopSellersDataModel(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      logo: json['logo'],
      rating: (json['rating'] is num) ? json['rating'].toDouble() : 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'name': name,
        'logo': logo,
        'rating': rating,
      };
}
