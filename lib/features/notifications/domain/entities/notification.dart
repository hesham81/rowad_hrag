import 'package:equatable/equatable.dart';
import 'package:rowad_hrag/features/notifications/data/models/conversion_notification_data_model.dart';
import 'package:rowad_hrag/features/notifications/domain/entities/conversion_notification_item.dart';

class NotificationEntity extends Equatable {
  final String id;

  // final int notificationTypeId;

  final String type;

  // final int notifiableId;
  final String notifiableType;

  final ConversionNotificationItemDataModel conversion;

  const NotificationEntity({
    required this.conversion,
    required this.id,
    // required this.notificationTypeId,
    required this.type,
    // required this.notifiableId,
    required this.notifiableType,
  });

  @override
  List<Object?> get props => [
        id,
        // notificationTypeId,
        type,
        // notifiableId,
        conversion,
        notifiableType,
      ];
}
