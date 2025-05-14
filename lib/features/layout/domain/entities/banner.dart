import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  final String imageUrl;
  final String url;

  Banner({
    required this.imageUrl,
    required this.url,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        imageUrl,
      ];
}
