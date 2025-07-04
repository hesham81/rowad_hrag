import 'dart:io';

import 'package:equatable/equatable.dart';

class ContactReplayRequest extends Equatable {
  final int id;

  final String reply;
  final List<File>? attachments;

  const ContactReplayRequest({
    required this.id,
    required this.reply,
    required this.attachments,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        reply,
        attachments,
      ];
}
