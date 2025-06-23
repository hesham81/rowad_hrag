import 'package:equatable/equatable.dart';
import 'package:rowad_hrag/features/product_details/domain/entities/product_details_review.dart';
import 'package:rowad_hrag/features/product_details/domain/entities/user.dart';

class ProductDetails extends Equatable {
  final int id;

  final String name;

  final String addedBy;

  final int categoryId;

  final List<String> photos;

  final String? videoProvider;

  final String description;

  final double unitPrice;

  final String? colors;

  final String discount;

  final String rating;

  final int cityId;

  final int stateId;

  final List<ProductDetailsReview> reviews;

  final User user;

  final String image;

  const ProductDetails({
    required this.image,
    required this.user,
    required this.reviews,
    required this.id,
    required this.name,
    required this.addedBy,
    required this.categoryId,
    required this.photos,
    required this.videoProvider,
    required this.description,
    required this.unitPrice,
    required this.colors,
    required this.discount,
    required this.rating,
    required this.cityId,
    required this.stateId,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        addedBy,
        categoryId,
        photos,
        videoProvider,
        description,
        unitPrice,
        colors,
        discount,
        rating,
        cityId,
        stateId,
        reviews,
        user,
        image,
      ];
}
