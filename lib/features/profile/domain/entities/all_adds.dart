import 'package:equatable/equatable.dart';

class AllAddsEntity extends Equatable {
  final int id;

  final String fileName;

  final String imageUrl;

  final String type;
  final String fileOriginalName;

  const AllAddsEntity({
    required this.fileOriginalName,
    required this.id,
    required this.fileName,
    required this.imageUrl,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        fileName,
        imageUrl,
        type,
        fileOriginalName,
      ];
}
