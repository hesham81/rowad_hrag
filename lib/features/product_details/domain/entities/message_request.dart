import 'package:equatable/equatable.dart';

class MessageRequest extends Equatable {
  final int conversationId;
  final String message;

  MessageRequest({
    required this.conversationId,
    required this.message,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        conversationId,
        message,
      ];
}
