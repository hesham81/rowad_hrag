import 'package:equatable/equatable.dart';

class Story extends Equatable {

  final String uid ;

  final String id;

  final String? title;

  final String file;

  final String uploaderImage ;

  final DateTime createdAt;

  int numberOfSeen;

  final String uploaderName ;

  Story( {
    required this.uid,
    required this.id,
    this.title,
    required this.file,
    required this.createdAt,
    required this.numberOfSeen,
    required this.uploaderName,
    required this.uploaderImage,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    uid,
        id,
        title,
        file,
        createdAt,
        numberOfSeen,
    uploaderName,
    uploaderImage,

      ];
}
