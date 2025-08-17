import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';
import 'package:rowad_hrag/features/all_reviews/presentation/pages/all_reviews_screen.dart';
import 'package:rowad_hrag/features/layout/data/models/reviews_data_model.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/navigator_home_footer_widget.dart';

import '../../../../core/services/cash_helper.dart';

class HomeButtonsSelectorFooterWidget extends StatefulWidget {
  final List<ReviewsDataModel>? allReviews;

  const HomeButtonsSelectorFooterWidget({
    super.key,
    this.allReviews,
  });

  @override
  State<HomeButtonsSelectorFooterWidget> createState() =>
      _HomeButtonsSelectorFooterWidgetState();
}

class _HomeButtonsSelectorFooterWidgetState
    extends State<HomeButtonsSelectorFooterWidget> {

  String? token;

  Future<void> _getCurrentToken() async {
    token = await CashHelper.getString("token");
    // log("Current Token is $token");
    setState(() {});
  }

  @override
  void initState() {
    Future.wait(
      [
        _getCurrentToken(),
      ],
    );
    super.initState();
  }

  var texts = [
    "البنود والظروف",
    "باقات الاشتراكات",
    "تقييمات الموقع",
    "سياسه الخصوصيه",
  ];

  var icons = [
    Icon(
      Icons.file_copy_sharp,
      color: Colors.black.withAlpha(80),
    ),
    Icon(
      Icons.arrow_back,
      color: Colors.black.withAlpha(80),
    ),
    Icon(
      Icons.headset_mic_outlined,
      color: Colors.black.withAlpha(80),
    ),
    Icon(
      Icons.error_outline,
      color: Colors.black.withAlpha(80),
    )
  ];

  var routes = [
    RouteNames.termsAndConditions,
    RouteNames.plansSubscriptions,
    RouteNames.blogs,
    RouteNames.privacyAndPolicy,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        0.01.height.hSpace,
        Divider(),
        0.01.height.hSpace,
        Text(
          "رواد حراج",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black.withAlpha(120),
              ),
        ),
        0.01.height.hSpace,
        Text(
          "موقع ( رواد حراج ) هو منصّة تجارة إلكترونية متكاملة ، تهدف إلى تسهيل عمليات البيع والشراء لجميع المنتجات والفئات والخدمات اللوجستية ، سواء للتجار أو الأفراد ويتميز هذا الموقع بخدماته المجانية لذوي الاحتياجات الخاصة ، ودعمه للأسر المنتجة من خلال تخفيضات مميزة . كما يمنح المستخدمين نقاطًا تُستخدم بدلاً من النسبة المطلوبة (1%)، مما يجعل كل عملية بيع أو شراء أو بث إعلان خطوة نحو النجاح مع كسب الأجر والثواب من رب العالمين .",
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black.withAlpha(120),
              ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 4,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              (index == 2)
                  ? slideLeftWidget(
                      newPage: AllReviewsScreen(reviews: widget.allReviews!),
                      context: context)
                  : Navigator.pushNamed(context, routes[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black.withAlpha(80),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icons[index],
                  0.02.height.hSpace,
                  Text(
                    texts[index],
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black.withAlpha(80),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        NavigatorHomeFooterWidget(),

      ],
    );
  }
}
