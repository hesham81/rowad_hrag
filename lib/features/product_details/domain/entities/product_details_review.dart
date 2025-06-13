import 'package:equatable/equatable.dart';
import 'package:rowad_hrag/features/product_details/domain/entities/user.dart';

class ProductDetailsReview extends Equatable {
  final int id;

  final num rating;

  final String comment;

  final DateTime createdAt;

  final User user;

  ProductDetailsReview({
    required this.id,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.user,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        rating,
        comment,
        createdAt,
        user,
      ];
}
