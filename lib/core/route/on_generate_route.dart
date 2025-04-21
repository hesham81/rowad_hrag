import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/layout/presentation/manager/home_cubit.dart';
import '/features/auth/presentation/manager/auth_cubit.dart';
import '/features/layout/presentation/pages/home_screen.dart';
import '../../features/auth/presentation/pages/sign_in.dart';
import '../../features/auth/presentation/pages/sign_up/pages/sign_up.dart';
import '/core/route/route_names.dart';

abstract class OnGenerateRoute {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.signIn:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            child: SignIn(),
            create: (context) => AuthCubit(),
          ),
        );
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HomeCubit>(
            create: (context) => HomeCubit()..getAllCategories(),
            child: HomeScreen(),
          ),
        );
      case RouteNames.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            child: SignUp(),
            create: (context) => AuthCubit()..getAllCities(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            child: SignIn(),
            create: (context) => AuthCubit(),
          ),
        );
    }
  }
}
