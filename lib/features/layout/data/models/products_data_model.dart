import 'package:rowad_hrag/features/layout/domain/entities/products.dart';

class ProductsDataModel extends Products {
  ProductsDataModel({
    required super.id,
    required super.slug,
    required super.name,
    required super.thumbnailImage,
    required super.hasDiscount,
    required super.discount,
    required super.strokedPrice,
    required super.mainPrice,
    required super.rating,
    required super.sales,
    super.stateName,
    super.cityName,
    required super.userName,
    super.createdAt,
    // required super.sales,
  });

  factory ProductsDataModel.fromJson(Map<String, dynamic> json) {
    return ProductsDataModel(
      id: json["id"],
      slug: json["slug"],
      name: json["name"],
      thumbnailImage: json["thumbnail_image"],
      hasDiscount: json["has_discount"],
      discount: json["discount"],
      strokedPrice: json["stroked_price"],
      mainPrice: json["main_price"],
      rating: json["rating"].toString(),
      sales: json["sales"].toString(),
      stateName: json["state_name"],
      cityName: json["city_name"],
      createdAt: (json["created_ago"] != null)
          ? DateTime.parse(json["created_ago"])
          : DateTime.now(),
      userName: json["user_name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "slug": slug,
      "name": name,
      "thumbnail_image": thumbnailImage,
      "has_discount": hasDiscount,
      "discount": discount,
      "stroked_price": strokedPrice,
      "main_price": mainPrice,
      "rating": rating,
      "sales": sales,
      "state_name": stateName,
      "city_name": cityName,
      "created_ago": createdAt,
      "user_name": userName,
    };
  }
}
