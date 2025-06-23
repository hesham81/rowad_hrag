import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/icon_error.dart';
import 'package:rowad_hrag/features/notifications/presentation/pages/success_notification_ui.dart';
import 'package:rowad_hrag/features/notifications/presentation/widgets/notification_item.dart';

import '../manager/notification_cubit.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الاشعارات",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TabBar(
                padding: EdgeInsets.zero,
                indicatorAnimation: TabIndicatorAnimation.elastic,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                tabs: [
                  Text(
                    "المدفوعات",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    "الطلبات",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    "المحادثات",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                ],
              ),

              BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  if (state is NotificationError) {
                    return IconError(
                      error: state.message,
                    );
                  } else if (state is NotificationLoaded) {
                    return SuccessNotificationUi(
                      notifications: state.notifications,
                    );
                  } else {
                    return CircularProgressIndicator(
                      backgroundColor: AppColors.secondaryColor,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
