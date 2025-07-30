import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/route/route_names.dart';

class HomeButtonsSelectorFooterWidget extends StatefulWidget {
  const HomeButtonsSelectorFooterWidget({super.key});

  @override
  State<HomeButtonsSelectorFooterWidget> createState() =>
      _HomeButtonsSelectorFooterWidgetState();
}

class _HomeButtonsSelectorFooterWidgetState
    extends State<HomeButtonsSelectorFooterWidget> {
  var texts = [
    "البنود والظروف",
    "باقات الاشتراكات",
    "تقييمات الموقع",
    "سياسه الخصوصيه",
  ];

  var icons = [
    Icon(
      Icons.file_copy_sharp,
    ),
    Icon(
      Icons.arrow_back,
    ),
    Icon(
      Icons.headset_mic_outlined,
    ),
    Icon(
      Icons.error_outline,
    )
  ];

  var routes = [
    RouteNames.termsAndConditions,
    RouteNames.plansSubscriptions,
    RouteNames.blogs,
    RouteNames.plans,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
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
              Navigator.pushNamed(context, routes[index]);
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
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
