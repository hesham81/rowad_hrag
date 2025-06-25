import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final int id;
  final String subject;

  final String details;

  final String code;

  final String status;

  ContactEntity({
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
      ];
}
