import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/notifications/data/models/notification_data_model.dart';

import '../widgets/notification_item.dart';

class SuccessNotificationUi extends StatelessWidget {
  final List<NotificationDataModel> notifications;

  const SuccessNotificationUi({
    super.key,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return
      ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => ListTile(
          title: NotificationItem(
            notificationDataModel: notifications[index],
          ),
          onTap: () {},
        ),
        separatorBuilder: (context, index) => Divider().hPadding(0.15.width),
        itemCount: notifications.length,
    );
  }
}
