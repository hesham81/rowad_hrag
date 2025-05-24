import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/features/adds/presentation/pages/adds_page.dart';
import 'package:rowad_hrag/features/all_types/presentation/pages/all_types.dart';
import 'package:rowad_hrag/features/bills/presentation/pages/upload_bills_page.dart';
import 'package:rowad_hrag/features/blogs/presentation/manager/blog_cubit.dart';
import 'package:rowad_hrag/features/blogs/presentation/pages/blogs.dart';
import 'package:rowad_hrag/features/contact_with_support/presentation/pages/contact_with_support.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/home_page.dart';
import 'package:rowad_hrag/features/plans/presentation/pages/plans_screen.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/profile.dart';
import 'package:rowad_hrag/features/splash/presentation/pages/splash_screen.dart';
import '../../features/layout/presentation/manager/home_cubit.dart';
import '/features/auth/presentation/manager/auth_cubit.dart';
import '../../features/auth/presentation/pages/sign_in.dart';
import '../../features/auth/presentation/pages/sign_up/pages/sign_up.dart';
import '/core/route/route_names.dart';

abstract class OnGenerateRoute {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.logOut:
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
            create: (context) => HomeCubit(),
            child:HomePage(),
          ),
        );
      case RouteNames.blogs:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<BlogCubit>(
            create: (context) => BlogCubit(),
            child: Blogs(),
          ),
        );

      case RouteNames.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            child: SignUp(),
            create: (context) => AuthCubit()..getAllCities(),
          ),
        );
      case RouteNames.allTypes:
        return MaterialPageRoute(
          builder: (context) => AllTypes(),
        );
      case RouteNames.plans:
        return MaterialPageRoute(
          builder: (context) => PlansScreen(),
        );

      case RouteNames.profile:
        return MaterialPageRoute(
          builder: (context) => Profile(),
        );

      case RouteNames.contactWithSupport:
        return MaterialPageRoute(
          builder: (context) => ContactWithSupport(),
        );

      case RouteNames.addAdds:
        return MaterialPageRoute(
          builder: (context) => AddsPage(),
        );

      case RouteNames.bills:
        return MaterialPageRoute(
          builder: (context) => UploadBillsPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
    }
  }
}
