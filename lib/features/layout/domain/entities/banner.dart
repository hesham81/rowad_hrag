import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String imageUrl;
  final String url;

  BannerEntity({
    required this.imageUrl,
    required this.url,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        imageUrl,
      ];
}
