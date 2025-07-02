import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/features/notifications/data/models/notification_data_model.dart';

class NotificationInfo extends StatelessWidget {
  final NotificationDataModel notificationDataModel;

  const NotificationInfo({
    super.key,
    required this.notificationDataModel,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 0.2.height,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notifications_active_outlined,
                color: Colors.green,
              ),
              Text(
                notificationDataModel.conversion.senderName??notificationDataModel.conversion.subject!,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ).center,
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Divider(),
          Text(
            notificationDataModel.conversion.message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
          ),
          // Text(
          //   notificationDataModel.conversion.createdAt.toString(),
          //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
          // ),
        ],
      ).allPadding(4),
    );
  }
}
