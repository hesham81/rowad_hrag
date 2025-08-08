import 'package:rowad_hrag/features/product_details/domain/entities/message_request.dart';

class MessageRequestDataModel extends MessageRequest {
  MessageRequestDataModel({
    required super.conversationId,
    required super.message,
  });

  factory MessageRequestDataModel.fromJson(Map<String, dynamic> json) {
    return MessageRequestDataModel(
      conversationId: json['conversation_id'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['conversation_id'] = conversationId;
    data['message'] = message;
    return data;
  }
}
