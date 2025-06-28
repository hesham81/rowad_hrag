import 'package:equatable/equatable.dart';

class AddsReviews extends Equatable {
  final int id;

  final double rate;

  final String comment;

  final String productName;

  final int userId;

  final String name;

  final String? avatar;

  const AddsReviews({
    required this.id,
    required this.rate,
    required this.comment,
    required this.productName,
    required this.userId,
    required this.name,
    required this.avatar,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        rate,
        comment,
        productName,
        userId,
        name,
        avatar,
      ];
}
