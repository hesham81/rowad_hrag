import 'package:equatable/equatable.dart';

class ConversionNotificationItem extends Equatable {
  final int conversionId;
  final String senderName;
  final String message;

  final String? link;

  final DateTime? readAt;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  const ConversionNotificationItem({
    required this.conversionId,
    required this.senderName,
    required this.message,
    required this.link,
    required this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        conversionId,
        senderName,
        message,
        link,
        readAt,
        createdAt,
        updatedAt,
      ];
}
