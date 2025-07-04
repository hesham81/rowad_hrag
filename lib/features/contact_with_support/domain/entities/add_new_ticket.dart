import 'dart:io';

import 'package:equatable/equatable.dart';

class AddNewTicket extends Equatable {
  final String subject;
  final String details;

  final List<File>? attachments;

  const AddNewTicket({
    required this.subject,
    required this.details,
    required this.attachments,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        subject,
        details,
        attachments,
      ];
}
