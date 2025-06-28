import 'package:equatable/equatable.dart';

class AllAddsEntity extends Equatable {
  final int id;

  final String name;

  final String image;
  final String category;
  final String price;

  const AllAddsEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        category,
        price,
      ];
}
