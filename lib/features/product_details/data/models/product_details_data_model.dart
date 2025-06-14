import 'package:rowad_hrag/features/product_details/data/models/product_details_review_data_model.dart';
import 'package:rowad_hrag/features/product_details/data/models/user_data_model.dart';
import 'package:rowad_hrag/features/product_details/domain/entities/product_details.dart';

class ProductDetailsDataModel extends ProductDetails {
  ProductDetailsDataModel({
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
      image: json['thumbnail']['file_name'],
      user: UserDataModel.fromJson(
        json['user'],
      ),
      reviews: List.from(
        json['reviews'],
      )
          .map(
            (e) => ProductDetailsReviewDataModel.fromJson(e),
          )
          .toList(),
      id: json['id'],
      name: json['name'],
      addedBy: json['added_by'],
      categoryId:
          (json['category_id'] is num) ? json['category_id'].toInt() : 0,
      photos: json['photos'],
      videoProvider: json['video_provider'],
      description: json['description'],
      unitPrice:
          (json['unit_price'] is num) ? json['unit_price'].toDouble() : 0.0,
      colors: json['colors'],
      discount: json['discount'].toString(),
      rating: json['rating'].toString(),
      cityId: json['city_id'],
      stateId: json['state_id'],
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
