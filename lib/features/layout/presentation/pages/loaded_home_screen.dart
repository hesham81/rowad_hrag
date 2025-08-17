import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/services/url_launcher_func.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/plans/presentation/manager/plans_cubit.dart';
import '/core/extensions/align.dart';
import '/core/extensions/extensions.dart';
import '/core/widget/custom_text_button.dart';
import '/features/all_product_search/presentation/pages/all_product_search.dart';
import '/features/layout/data/models/banner_data_model.dart';
import '/features/layout/data/models/category_data_model.dart';
import '/features/layout/data/models/top_sellers_data_model.dart';
import '/features/layout/presentation/widget/banners_home_screen.dart';
import '/features/layout/presentation/widget/biggest_inf.dart';
import '/features/layout/presentation/widget/home_buttons_selector_footer_widget.dart';
import '/features/layout/presentation/widget/productive_families_products_widget_home_screen.dart';
import '/features/layout/presentation/widget/rating_widget_home_screen.dart';
import '/features/layout/presentation/widget/second_banners_widget_home_screen.dart';
import '/features/layout/presentation/widget/special_products_home_screen.dart';
import '/features/layout/presentation/widget/sub_categories_home_widget.dart';
import '../../data/models/products_data_model.dart';
import '../../data/models/reviews_data_model.dart';
import '../../data/models/visitor_status_data_model.dart';
import '../widget/navigator_home_footer_widget.dart';

class LoadedHomeScreenUi extends StatelessWidget {
  final List<CategoryDataModel> categories;
  final List<BannerDataModel> banner;

  final List<BannerDataModel> secondBanner;

  final List<ProductsDataModel> specialProducts;

  final List<ProductsDataModel> productiveFamiliesProducts;

  final List<ProductsDataModel> specialNeedsProducts;

  final List<ProductsDataModel> allProducts;

  final List<ReviewsDataModel> reviews;

  final VisitorStatesDataModel visitorStatesDataModel;

  final List<TopSellersDataModel> topSellers;

  final Function(String, int) subCategoriesFunc;

  const LoadedHomeScreenUi({
    super.key,
    required this.categories,
    required this.banner,
    required this.secondBanner,
    required this.specialProducts,
    required this.productiveFamiliesProducts,
    required this.specialNeedsProducts,
    required this.allProducts,
    required this.reviews,
    required this.visitorStatesDataModel,
    required this.topSellers,
    required this.subCategoriesFunc,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SubCategoriesHomeWidget(
            categories: categories,
            callBack: subCategoriesFunc,
          ),
          0.01.height.hSpace,
          BannersHomeScreen(
            banners: banner,
          ),
          0.01.height.hSpace,
          0.01.height.hSpace,
          SpecialProductsHomeScreen(
            title: "إعلانات مميزة",
            products: specialProducts,
          ),
          0.01.height.hSpace,
          SecondBannersWidgetHomeScreen(
            secondBanner: secondBanner,
          ),
          0.01.height.hSpace,
          0.01.height.hSpace,
          SpecialProductsHomeScreen(
            title: "إعلانات لذوي الاحتياجات الخاصة",
            products: specialNeedsProducts,
            isGrey: true,
          ),
          0.01.height.hSpace,
          0.01.height.hSpace,
          SpecialProductsHomeScreen(
            title: "إعلانات الأسر المنتجة والحرف اليدوية",
            products: productiveFamiliesProducts,
            isGrey: true,
          ),
          0.01.height.hSpace,
          0.01.height.hSpace,
          // Row(
          //   children: [
          //     CustomTextButton(
          //       text: "عرض الكل",
          //       onPressed: () => slideLeftWidget(
          //           newPage: AllProductSearch(
          //             products: allProducts,
          //           ),
          //           context: context),
          //     ),
          //     Spacer(),
          //     Text(
          //       "إعلانات جديدة",
          //       style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //             fontWeight: FontWeight.bold,
          //           ),
          //     ).alignRight().hPadding(0.03.width),
          //   ],
          // ),
          0.01.height.hSpace,
          SpecialProductsHomeScreen(
            products: allProducts,
            title: "إعلانات جديدة",
            isAllProducts: true,
            isGrey: true,
          ),
          // ProductiveFamiliesProductsWidgetHomeScreen(
          //   productiveFamiliesProducts: allProducts.take(10).toList(),
          // ),
          0.01.height.hSpace,
          InkWell(
            onTap: () =>
                UrlLauncherFunc.openUrl("https://rowad-harag.com/add-ad"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/grR3OjQBlHOPH9ymqSvOQSBohi0MyxTuC4w9MaYv.png",
              ),
            ).hPadding(0.02.width),
          ),
          0.01.height.hSpace,
          Container(
            height: 0.2.height,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(70),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "تتميز منصة رواد حراج بالبيع والشراء وهي منصة موثقة من المركز السعودي للأعمال التابع لوزارة التجارة",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ).center.allPadding(5),
          ).allPadding(10),
          0.01.height.hSpace,
          RatingWidgetHomeScreen(
            reviews: reviews,
          ),
          0.01.height.hSpace,
          BiggestInf(
            list: topSellers,
          ),
          BlocProvider(
            create: (context) => PlansCubit(),
            child: HomeButtonsSelectorFooterWidget(
              allReviews: reviews,
            ),
          )
        ],
      ),
    );
  }
}
