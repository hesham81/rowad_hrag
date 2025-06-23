import 'package:rowad_hrag/features/profile/domain/entities/seller_profile.dart';

class SellerProfileDataModel extends SellerProfile {
  const SellerProfileDataModel({
    required super.name,
    required super.email,
    // required super.type,
    required super.image,
    required super.id,
    super.phone,
    required super.rating,
    required super.verified,
    required super.verifiedImg,
    required super.products,
    required super.orders,
    required super.sales,
    required super.description,
    required super.title,
  });

  factory SellerProfileDataModel.fromJson(Map<String, dynamic> json) {
    return SellerProfileDataModel(
      name: json['name'],
      email: json['email'],
      // type: json['type'],
      image: json['seller_package_img'],
      id: json['user_id'],
      phone: json['phone'],
      rating: (json['rating'] is num && json['rating'] is double)
          ? json['rating']
          : double.parse(json['rating'].toString()),
      verified: json['verified'],
      verifiedImg: json['verified_img'],
      products: (json['products'] is num )? json['products'] : 1,
      orders: (json['orders'] is num )? json['orders'] : 1,
      sales: json['sales'],
      description: json['description'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        // 'type': type,
        'avatar_original': image,
        'id': id,
        'phone': phone,
        'rating': rating,
        'verified': verified,
        'verified_img': verifiedImg,
        'products': products,
        'orders': orders,
        'sales': sales,
        'description': description,
        'title': title,
      };
}
