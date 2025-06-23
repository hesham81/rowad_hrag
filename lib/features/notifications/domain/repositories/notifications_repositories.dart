import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/features/notifications/data/models/notification_data_model.dart';

abstract class NotificationsRepositories {
  Future<Either<Failure, List<NotificationDataModel>>> getAllNotifications();
}
