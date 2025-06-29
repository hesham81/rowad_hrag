import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/notifications/data/models/notification_data_model.dart';
import 'package:rowad_hrag/features/notifications/presentation/widgets/notification_info.dart';

class NotificationItem extends StatefulWidget {
  final NotificationDataModel notificationDataModel;

  const NotificationItem({
    super.key,
    required this.notificationDataModel,
  });

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => NotificationInfo(
        notificationDataModel: widget.notificationDataModel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.notifications,
        ),
        0.01.width.vSpace,
        Text(
          widget.notificationDataModel.conversion.senderName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
        ),
        0.1.width.vSpace,
        Text(
          widget.notificationDataModel.conversion.message,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
        ),
        Spacer(),
        IconButton(
          onPressed: _openBottomSheet,
          icon: Icon(Icons.more_horiz),
        ),
      ],
    ).allPadding(2);
  }
}
