part of 'notification_cubit.dart';

class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationDataModel> notifications;

  NotificationLoaded({required this.notifications});
}

class NotificationError extends NotificationState {
  final String message;

  NotificationError({required this.message});
}
