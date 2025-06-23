import 'package:rowad_hrag/features/notifications/domain/entities/conversion_notification_item.dart';

class ConversionNotificationItemDataModel extends ConversionNotificationItem {
  const ConversionNotificationItemDataModel({
    required super.conversionId,
    required super.senderName,
    required super.message,
    required super.link,
    required super.readAt,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ConversionNotificationItemDataModel.fromJson(
      Map<String, dynamic> json) {
    return ConversionNotificationItemDataModel(
      conversionId: json['conversation_id'],
      senderName: json['sender_name'],
      message: json['message'],
      link: json['link'],
      readAt:
          (json['read_at'] == null) ? null : DateTime.parse(json['read_at']),
      createdAt: (json['created_at'] == null)
          ? null
          : DateTime.parse(json['created_at']),
      updatedAt: (json['updated_at'] == null)
          ? null
          : DateTime.parse(json['updated_at']),
    );
  }

  toJson() {
    return {
      'conversation_id': conversionId,
      'sender_name': senderName,
      'message': message,
      'link': link,
      'read_at': readAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
