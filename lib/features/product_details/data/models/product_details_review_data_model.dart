import 'package:rowad_hrag/features/product_details/data/models/user_data_model.dart';
import 'package:rowad_hrag/features/product_details/domain/entities/product_details_review.dart';

class ProductDetailsReviewDataModel extends ProductDetailsReview {
  ProductDetailsReviewDataModel({
    required super.id,
    required super.rating,
    required super.comment,
    required super.createdAt,
    required super.user,
  });

  factory ProductDetailsReviewDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsReviewDataModel(
      id: json['id'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: DateTime.parse(
        json['created_at'],
      ),
      user: UserDataModel.fromJson(
        json['user'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rating'] = rating;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    data['user'] = user;
    return data;
  }
}
