import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/notification_data_model.dart';
import '../repositories/notifications_repositories.dart';

class GetAllNotificationsUseCase {
  final NotificationsRepositories _notificationsRepositories;

  GetAllNotificationsUseCase(this._notificationsRepositories);

  Future<Either<Failure, List<NotificationDataModel>>> call() async {
    return await _notificationsRepositories.getAllNotifications();
  }
}
