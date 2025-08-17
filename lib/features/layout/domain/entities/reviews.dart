import 'package:equatable/equatable.dart';

class Reviews extends Equatable {
  final String? shopName;

  final String? shopSlug;

  final int rate;

  final String review;

  Reviews({
    required this.shopName,
    required this.shopSlug,
    required this.rate,
    required this.review,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        shopName,
        shopSlug,
        rate,
        review,
      ];
}
