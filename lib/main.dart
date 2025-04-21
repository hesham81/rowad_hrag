import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rowad_hrag/core/services/loading_manager.dart';
import '/core/route/on_generate_route.dart';
import '/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      theme: AppTheme.lightTheme,
      navigatorKey: navigationKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: OnGenerateRoute.route,
    );
  }
}

var navigationKey = GlobalKey<NavigatorState>();
