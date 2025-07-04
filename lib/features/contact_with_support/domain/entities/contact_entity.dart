import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final int id;
  final String subject;

  final String details;

  final int code;

  final String status;

  final List<String>? files;

  final int clientViewed;


  ContactEntity({
    this.files,
    required this.clientViewed,
    required this.id,
    required this.subject,
    required this.details,
    required this.code,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        subject,
        details,
        code,
        status,
        files,
        clientViewed,
      ];
}
