import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';
import 'package:rowad_hrag/features/add-ads/presentation/widgets/adds_text_form_field.dart';

class AddsPage extends StatefulWidget {
  const AddsPage({super.key});

  @override
  State<AddsPage> createState() => _AddsPageState();
}

class _AddsPageState extends State<AddsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  ArrowWidget(),
                  Spacer(),
                  Text(
                    "أضف اعلان جديد",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.greenColor,
                        ),
                  ),
                ],
              ),
              0.01.height.hSpace,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.greenColor,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    0.01.height.hSpace,
                    Text(
                      "تنبيه !",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ).center,
                    0.01.height.hSpace,
                    Text(
                      "أقسم بالله العظيم أن ألتزم بسداد النسبة الموجودة على حساب تطبيق رواد حراج كما هو موضح داخل التطبيق بنسبة 1% دون تأخير، وأتحمل المسؤولية الكاملة إذا لم أبادر بالدفع فوراً عند البيع أو الشراء أو بث الإعلانات. كما ألتزم بعدم بث أو عرض مواد محظورة وعدم الإساءة لأي عضو، وألتزم بسياسات وتعليمات تطبيق رواد حراج المبنية على تعاليم ديننا الحنيف ووفقاً للأنظمة المعمول بها في المملكة العربية السعودية. والله شاهد على ما أقول.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black.withAlpha(120)),
                    ),
                    0.01.height.hSpace,
                  ],
                ).hPadding(0.02.width),
              ),
              0.03.height.hSpace,
              AddsTextFormField(
                controller: TextEditingController(),
                text: "عنوان الإعلان",
              ),
              0.03.height.hSpace,
              AddsTextFormField(
                controller: TextEditingController(),
                text: "عنوان الإعلان",
              ),
            ],
          ).hPadding(0.03.width),
        ),
      ),
    );
  }
}
