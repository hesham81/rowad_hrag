import 'package:rowad_hrag/features/adds_reviews/domain/entities/adds_reviews.dart';

class AddsReviewsDataModel extends AddsReviews {
  const AddsReviewsDataModel({
    required super.id,
    required super.rate,
    required super.comment,
    required super.productName,
    required super.userId,
    required super.name,
    required super.avatar,
  });

  factory AddsReviewsDataModel.fromJson(Map<String, dynamic> json) {
    return AddsReviewsDataModel(
      id: json['id'],
      rate: (json['rating'] is num )? (json['rating'] as num).toDouble() : 0.0,
      comment: json['comment'],
      productName: json['product_name'],
      userId: json['user_id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rate': rate,
      'comment': comment,
      'product_name': productName,
      'user_id': userId,
      'name': name,
      'avatar': avatar,
    };
  }
}
