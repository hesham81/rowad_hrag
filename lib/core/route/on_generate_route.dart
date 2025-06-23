import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/features/all_types/presentation/manager/all_categories_cubit.dart';
import 'package:rowad_hrag/features/bills/presentation/pages/upload_bills_page.dart';
import 'package:rowad_hrag/features/blogs/presentation/manager/blog_cubit.dart';
import 'package:rowad_hrag/features/blogs/presentation/pages/blogs.dart';
import 'package:rowad_hrag/features/contact_with_support/presentation/pages/contact_with_support.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/home_page.dart';
import 'package:rowad_hrag/features/plans/presentation/manager/plans_cubit.dart';
import 'package:rowad_hrag/features/plans/presentation/pages/plans_screen.dart';
import 'package:rowad_hrag/features/product_details/presentation/manager/product_details_cubit.dart';
import 'package:rowad_hrag/features/profile/presentation/manager/profile_cubit.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/profile.dart';
import 'package:rowad_hrag/features/splash/presentation/pages/splash_screen.dart';
import 'package:rowad_hrag/features/product_details/presentation/pages/product_item_screen.dart';
import '../../features/adds/presentation/pages/adds_page.dart';
import '../../features/all_types/presentation/pages/all_types.dart';
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
            child: HomePage(),
          ),
        );
      case RouteNames.blogs:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<BlogCubit>(
            create: (context) => BlogCubit(),
            child: Blogs(),
          ),
        );
      case RouteNames.productDetails:
        final slug = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProductDetailsCubit>(
            create: (context) => ProductDetailsCubit()
              ..getProductDetails(
                slug ?? '',
              ),
            child: ProductItemScreen(),
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
          builder: (context) => BlocProvider<AllCategoriesCubit>(
            child: AllTypes(),
            create: (context) => AllCategoriesCubit()..getAllCategories(),
          ),
        );
      case RouteNames.plans:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<PlansCubit>(
            child: PlansScreen(),
            create: (context) => PlansCubit()..getAllPlans(),
          ),
        );

      case RouteNames.profile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            child: Profile(),
            create: (context) => ProfileCubit()
          ),
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
