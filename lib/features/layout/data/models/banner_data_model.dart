import 'package:rowad_hrag/features/layout/domain/entities/banner.dart';

class BannerDataModel extends Banner {
  BannerDataModel({
    required super.imageUrl,
    required super.url,
  });

  factory BannerDataModel.fromJson(Map<String, dynamic> json) {
    return BannerDataModel(
      imageUrl: json['photo'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'photo': imageUrl,
      'url': url,
    };
  }
}
