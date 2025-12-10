import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rowad_hrag/core/services/loading_manager.dart';
import 'package:rowad_hrag/features/payment_footer/presentation/manager/plans_cubit.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/core/route/on_generate_route.dart';
import '/core/theme/app_theme.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://jqeavyiffqkbpjfyzfss.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpxZWF2eWlmZnFrYnBqZnl6ZnNzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ4Njc5NDUsImV4cCI6MjA4MDQ0Mzk0NX0.vJ-YKzdweuT0aiX-gDpNw99hsG5QmTRiHRp3yZDpnUY',
  );  await Hive.initFlutter();
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
