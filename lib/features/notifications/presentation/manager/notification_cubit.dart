import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/web_services.dart';
import 'package:rowad_hrag/features/notifications/data/data_sources/remote_notifications_data_source.dart';
import 'package:rowad_hrag/features/notifications/data/repositories/notifications_repositories_implementation.dart';
import 'package:rowad_hrag/features/notifications/domain/repositories/notifications_repositories.dart';
import 'package:rowad_hrag/features/notifications/domain/use_cases/get_all_notifications_use_case.dart';

import '../../data/data_sources/notifications_interface_data_source.dart';
import '../../data/models/notification_data_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial()) {
    getAllNotifications();
  }

  late GetAllNotificationsUseCase _getAllNotificationsUseCase;

  late NotificationsRepositories _notificationsRepositories;

  late NotificationsInterfaceDataSource _notificationsInterfaceDataSource;

  late WebServices _dio;

  Future<void> getAllNotifications() async {
    try {
      _dio = WebServices();
      _notificationsInterfaceDataSource =
          RemoteNotificationsDataSource(_dio.tokenDio);
      _notificationsRepositories = NotificationsRepositoriesImplementation(
          _notificationsInterfaceDataSource);
      _getAllNotificationsUseCase =
          GetAllNotificationsUseCase(_notificationsRepositories);

      var response = await _getAllNotificationsUseCase.call();
      response.fold((failure) {
        emit(
          NotificationError(
            message: failure.messageAr ?? failure.messageEn ?? "حدث خطأ ما",
          ),
        );
      }, (notifications) {
        emit(
          NotificationLoaded(
            notifications: notifications,
          ),
        );
      });
    } catch (error) {
      emit(
        NotificationError(
          message: error.toString(),
        ),
      );
    }
  }
}
