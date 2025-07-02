import 'package:rowad_hrag/features/profile/domain/entities/all_adds.dart';

class AllAddsDataModel extends AllAddsEntity {
  const AllAddsDataModel({
    required super.id,
    required super.name,
    required super.image,
    required super.category,
    required super.price,
  });

  factory AllAddsDataModel.fromJson(Map<String, dynamic> json) {
    return AllAddsDataModel(
      id: json['id'],
      name: json['name'],
      image: json['thumbnail_img'],
      category: json['category'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'thumbnail_img': image,
        'category': category,
        'price': price,
      };
}
