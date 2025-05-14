import 'package:rowad_hrag/features/layout/domain/entities/reviews.dart';

class ReviewsDataModel extends Reviews {
  ReviewsDataModel({
    required super.shopName,
    required super.shopSlug,
    required super.rate,
    required super.review,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewsDataModel && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  factory ReviewsDataModel.fromJson(Map<String, dynamic> json) =>
      ReviewsDataModel(
        shopName: json["shop_name"],
        shopSlug: json["shop_slug"],
        rate: json["rate"] as int,
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "shop_name": shopName,
        "shop_slug": shopSlug,
        "rate": rate,
        "review": review,
      };
}
