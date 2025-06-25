import '../../domain/entities/sub_categories_products.dart';

class SubCategoriesProductsDataModel extends SubCategoriesProducts {
  const SubCategoriesProductsDataModel({
    required super.id,
    required super.slug,
    required super.image,
    required super.price,
    required super.rating, required super.name,

  });

  factory SubCategoriesProductsDataModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesProductsDataModel(
      id: json['id'],
      slug: json['slug'],
      image: json['thumbnail_image'],
      price: json['stroked_price'],
      rating: (json['rating'] is num)
          ? (json['rating'] as num).toDouble()
          : json['rating'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'thumbnail_image': image,
      'stroked_price': price,
      'rating': rating,
      'name': name
    };
  }
}
