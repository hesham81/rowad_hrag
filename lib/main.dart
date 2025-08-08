import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/loading_manager.dart';
import 'package:rowad_hrag/features/payment_footer/presentation/manager/plans_cubit.dart';
import '/core/route/on_generate_route.dart';
import '/core/theme/app_theme.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(
    BlocProvider(
      create: (context) => PlansCubit(),
      child: const MyApp(),
    ),
  );
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      theme: AppTheme.lightTheme,
      navigatorKey: navigationKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: OnGenerateRoute.route,
    );
  }
}
