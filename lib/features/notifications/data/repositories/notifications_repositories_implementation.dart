import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rowad_hrag/core/failures/failure.dart';
import 'package:rowad_hrag/core/failures/server_failure.dart';
import 'package:rowad_hrag/features/notifications/data/data_sources/notifications_interface_data_source.dart';
import 'package:rowad_hrag/features/notifications/data/models/notification_data_model.dart';
import 'package:rowad_hrag/features/notifications/domain/repositories/notifications_repositories.dart';

class NotificationsRepositoriesImplementation
    implements NotificationsRepositories {
  final NotificationsInterfaceDataSource _notificationsInterfaceDataSource;

  NotificationsRepositoriesImplementation(
      this._notificationsInterfaceDataSource,
      );

  @override
  Future<Either<Failure, List<NotificationDataModel>>>
  getAllNotifications() async {
    try {
      var response =
      await _notificationsInterfaceDataSource.getAllNotifications();

      if (response.data["success"] == true && response.data.containsKey('data')) {
        List<NotificationDataModel> notifications = List<Map<String, dynamic>>.from(response.data['data']['data'])
            .map((e) => NotificationDataModel.fromJson(e))
            .toList();

        return Right(notifications);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"] ?? "Failed to load notifications",
          ),
        );
      }
    } catch (error) {
      log("Error fetching notifications: $error");
      return Left(
        ServerFailure(
          statusCode: "500",
          message: error.toString(),
        ),
      );
    }
  }
}