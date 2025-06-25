import 'package:equatable/equatable.dart';

class UploadedFiles extends Equatable {
  final int id;

  final String image;

  final String fileName;

  const UploadedFiles({
    required this.fileName,
    required this.id,
    required this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        image,
        fileName,
      ];
}
