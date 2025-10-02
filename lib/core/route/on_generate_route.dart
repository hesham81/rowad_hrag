import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/features/adds_reviews/presentation/pages/adds_reviews.dart';
import 'package:rowad_hrag/features/all_types/presentation/manager/all_categories_cubit.dart';
import 'package:rowad_hrag/features/all_uploaded_files/presentation/pages/all_uploaded_files.dart';
import 'package:rowad_hrag/features/auth/presentation/pages/forget_password/pages/forget_password.dart';
import 'package:rowad_hrag/features/bills/presentation/pages/upload_bills_page.dart';
import 'package:rowad_hrag/features/blogs/presentation/manager/blog_cubit.dart';
import 'package:rowad_hrag/features/blogs/presentation/pages/blogs.dart';
import 'package:rowad_hrag/features/contact_with_support/presentation/manager/contacts_cubit.dart';
import 'package:rowad_hrag/features/contact_with_support/presentation/pages/contact_with_support.dart';
import 'package:rowad_hrag/features/layout/presentation/pages/home_page.dart';
import 'package:rowad_hrag/features/notifications/presentation/manager/notification_cubit.dart';
import 'package:rowad_hrag/features/notifications/presentation/pages/notifications.dart';
import 'package:rowad_hrag/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:rowad_hrag/features/plans/presentation/manager/plans_cubit.dart';
import 'package:rowad_hrag/features/plans/presentation/pages/plans_screen.dart';
import 'package:rowad_hrag/features/plans_subscriptions/presentation/pages/plans_subscriptions.dart';
import 'package:rowad_hrag/features/privacy_and_policy/presentation/pages/privacy_and_policy.dart';
import 'package:rowad_hrag/features/product_details/presentation/manager/product_details_cubit.dart';
import 'package:rowad_hrag/features/profile/presentation/manager/profile_cubit.dart';
import 'package:rowad_hrag/features/profile/presentation/pages/profile.dart';
import 'package:rowad_hrag/features/settings/presentation/manager/shop_settings_cubit.dart';
import 'package:rowad_hrag/features/settings/presentation/pages/profile_settings.dart';
import 'package:rowad_hrag/features/splash/presentation/pages/splash_screen.dart';
import 'package:rowad_hrag/features/product_details/presentation/pages/product_item_screen.dart';
import 'package:rowad_hrag/features/sub_categories_product_details/presentation/pages/sub_categories_product.dart';
import 'package:rowad_hrag/features/terms_and_conditions/presentation/pages/terms_and_conditions.dart';
import '../../features/add-ads/presentation/manager/addAdCubit.dart';
import '../../features/add-ads/presentation/pages/adds_page.dart';
import '../../features/adds_reviews/presentation/manager/adds_reviews_cubit.dart';
import '../../features/all_types/presentation/pages/all_types.dart';
import '../../features/all_uploaded_files/presentation/manager/files_cubit.dart';
import '../../features/layout/presentation/manager/home_cubit.dart';
import '../../features/login_to_continue/presentation/pages/login_to_continue.dart';
import '../../features/sub_categories_product_details/presentation/manager/sub_categories_product_cubit.dart';
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
      case RouteNames.onboarding:
        return MaterialPageRoute(
          builder: (context) =>OnboardingScreen(),
        );
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
            child: HomePage(),
          ),
        );
      case RouteNames.termsAndConditions:
        return MaterialPageRoute(
          builder: (context) => TermsAndConditions(),
        );
      case RouteNames.plansSubscriptions:
        return MaterialPageRoute(
          builder: (context) => PlansSubscriptions(),
        );
      case RouteNames.privacyAndPolicy:
        return MaterialPageRoute(
          builder: (context) => PrivacyAndPolicy(),
        );
      // case RouteNames.allReviews:
      //   return MaterialPageRoute(
      //     builder: (context) => AllReviewsScreen(),
      //   );
      case RouteNames.loginToContinue:
        return MaterialPageRoute(
          builder: (context) => LoginToContinue(),
        );
      case RouteNames.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPassword(),
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
              child: Profile(), create: (context) => ProfileCubit()),
        );

      case RouteNames.contactWithSupport:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ContactsCubit>(
            child: ContactWithSupport(),
            create: (context) => ContactsCubit()..getAllContacts(),
          ),
        );

      case RouteNames.notifications:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => NotificationCubit(),
            child: Notifications(),
          ),
        );

      case RouteNames.bills:
        return MaterialPageRoute(
          builder: (context) => UploadBillsPage(),
        );
      case RouteNames.subCategoriesProductDetails:
        final slug = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            child: SubCategoriesProduct(),
            create: (context) => SubCategoriesProductCubit()
              ..getAllSubCategoriesProductDetails(
                slug ?? '',
              ),
          ),
        );
      case RouteNames.addsReviews:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            child: AddsReviews(),
            create: (context) => AddsReviewsCubit()..getAllAddsReviews(),
          ),
        );
      case RouteNames.addAdds:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            child: AddsPage(),
            create: (context) => AddAdCubit(),
          ),
        );
      case RouteNames.shopSettings:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            child: ProfileSettings(),
            create: (context) => ShopSettingsCubit()..getAllSettings(),
          ),
        );
      case RouteNames.allFiles:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<FilesCubit>(
            child: AllUploadedFiles(),
            create: (context) => FilesCubit()..getAllFiles(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
    }
  }
}
