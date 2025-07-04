import '../../domain/entities/contact_replay_request.dart';

class ContactReplayRequestDataModel extends ContactReplayRequest {
  const ContactReplayRequestDataModel({
    required super.id,
    required super.reply,
    required super.attachments,
  });

  factory ContactReplayRequestDataModel.fromJson(Map<String, dynamic> json) {
    return ContactReplayRequestDataModel(
      id: json['id'],
      reply: json['reply'],
      attachments: json['attachments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reply': reply,
      'attachments': attachments,
    };
  }
}
