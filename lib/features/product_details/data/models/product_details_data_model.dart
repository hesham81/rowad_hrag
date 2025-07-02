import 'package:rowad_hrag/features/product_details/data/models/product_details_review_data_model.dart';
import 'package:rowad_hrag/features/product_details/data/models/user_data_model.dart';
import 'package:rowad_hrag/features/product_details/domain/entities/product_details.dart';

class ProductDetailsDataModel extends ProductDetails {
  const ProductDetailsDataModel({
    required super.id,
    required super.name,
    required super.addedBy,
    required super.categoryId,
    required super.photos,
    required super.videoProvider,
    required super.description,
    required super.unitPrice,
    required super.colors,
    required super.discount,
    required super.rating,
    required super.cityId,
    required super.stateId,
    required super.user,
    required super.reviews,
    required super.image,
  });

  factory ProductDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsDataModel(
      image: json["product"]['thumbnail']['file_name'],
      user: UserDataModel.fromJson(
        json["product"]['user'],
      ),
      reviews: List.from(
        json["product"]['reviews'],
      )
          .map(
            (e) => ProductDetailsReviewDataModel.fromJson(e),
          )
          .toList(),
      id: json["product"]['id'],
      name: json["product"]['name'],
      addedBy: json["product"]['added_by'],
      categoryId:
          (json["product"]['category_id'] is num) ? json["product"]['category_id'].toInt() : 0,
      videoProvider: json["product"]['video_provider'],
      photos: json['photos'] is List
          ? List<String>.from(json['photos'].map((x) => x.toString()))
          : (json['photos'] as String)
          .split(',')
          .map((s) => s.trim())
          .toList(),
      description: json["product"]['description'],
      unitPrice:
          (json["product"]['unit_price'] is num) ? json["product"]['unit_price'].toDouble() : 0.0,
      colors: json["product"]['colors'],
      discount: json["product"]['discount'].toString(),
      rating: json["product"]['rating'].toString(),
      cityId: json["product"]['city_id'],
      stateId: json["product"]['state_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['added_by'] = addedBy;
    data['category_id'] = categoryId;
    data['photos'] = photos;
    data['video_provider'] = videoProvider;
    data['description'] = description;
    data['unit_price'] = unitPrice;
    data['colors'] = colors;
    data['discount'] = discount;
    data['rating'] = rating;
    data['city_id'] = cityId;
    data['state_id'] = stateId;
    data['user'] = user;
    data['reviews'] = reviews;
    return data;
  }
}
