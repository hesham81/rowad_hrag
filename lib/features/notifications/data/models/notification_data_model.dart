import 'package:rowad_hrag/features/notifications/data/models/conversion_notification_data_model.dart';
import 'package:rowad_hrag/features/notifications/domain/entities/conversion_notification_item.dart';
import 'package:rowad_hrag/features/notifications/domain/entities/notification.dart';

class NotificationDataModel extends NotificationEntity {
  const NotificationDataModel({
    required super.conversion,
    required super.id,
    required super.notificationTypeId,
    required super.type,
    required super.notifiableId,
    required super.notifiableType,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) {
    return NotificationDataModel(
      conversion:ConversionNotificationItemDataModel.fromJson(json['data']),
      id: json['id'],
      notificationTypeId: json['notification_type_id'],
      type: json['type'],
      notifiableId: json['notifiable_id'],
      notifiableType: json['notifiable_type'],
    );
  }

  toJson() {
    return {
      'data': conversion,
      'id': id,
      'notification_type_id': notificationTypeId,
      'type': type,
      'notifiable_id': notifiableId,
      'notifiable_type': notifiableType,
    };
  }
}
