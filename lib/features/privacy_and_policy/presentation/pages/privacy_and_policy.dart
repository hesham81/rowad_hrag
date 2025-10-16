import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';

import '../../../../core/theme/app_colors.dart';

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  ArrowWidget(),
                  0.2.width.vSpace,
                  Text(
                    "سياسة رواد حراج",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor,
                        ),
                  ).center,
                ],
              ),
            ),
            Text(
              'أقسم بالله العلي العظيم أنني ألتزم التزامًا تامًّا بدفع النسبة المقررة على جميع العمليات التي أُجريها عبر تطبيق "رواد حراج"، والمحددة بنسبة ١٪ (واحد بالمائة) من قيمة كل عملية، سواء كانت بيعًا أو شراءً أو نشر إعلان أو دعاية تجارية، وذلك وفقًا لما هو موضح داخل التطبيق. وأتعهد بأن أقوم بسداد هذه النسبة فور إتمام أيٍّ من هذه العمليات دون أي تأخير أو تسويف، وأتحملها بذمتي الشخصية أمام الله عز وجل، وأمام القائمين على التطبيق، وفي حال تخلّفت عن الدفع في وقته المحدد، فإنني أقرّ بأنني مخالف للشروط وأتحمل جميع العواقب المترتبة على ذلك. كما ألتزم التزامًا قاطعًا بعدم نشر أو عرض أو تداول أي محتوى يُعدّ ممنوعًا شرعًا أو محظورًا نظامًا، كالصور أو الفيديوهات أو النصوص غير الأخلاقية، أو ما يروّج للمحرمات، أو يشجع على الكراهية أو العنف أو التمييز، أو ينتهك خصوصية الآخرين. وأتعهد بعدم الإساءة إلى أي عضو من أعضاء التطبيق، سواء بالكلام الجارح، أو التشهير، أو التضليل، أو بأي وسيلة كانت. وأقرّ بأنني سأعمل دائمًا وفق سياسة التطبيق وتعليماته، والتي بُنِيَت على أسس ديننا الإسلامي الحنيف، وتماشيًا مع الأنظمة واللوائح المعمول بها في المملكة العربية السعودية، بما في ذلك نظام مكافحة الجرائم المعلوماتية، وأنظمة التجارة الإلكترونية، وحماية المستهلك. وأعلم أن أي مخالفة مني لما سبق يُعدّ خرقًا لاتفاق الاستخدام، وقد يؤدي إلى إيقاف حسابي أو اتخاذ الإجراءات القانونية اللازمة. والله على ما أقول عالم وشهيد، ولا حول ولا قوة إلا بالله العلي العظيم.',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
