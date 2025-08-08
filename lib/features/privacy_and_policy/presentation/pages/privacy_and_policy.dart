import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/home_buttons_selector_footer_widget.dart';
import '../../../../core/theme/app_colors.dart';

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "سياسة الخصوصية",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildSection(
              context,
              content: "الخصوصية وبيان سريّة المعلومات: نقدر مخاوفكم واهتمامكم بشأن خصوصية بياناتكم على شبكة الإنترنت. لقد تم إعداد هذه السياسة لمساعدتكم في فهم طبيعة البيانات التي نقوم بتجميعها منكم عند زيارتكم لموقعنا على شبكة الإنترنت وكيفية تعاملنا مع هذه البيانات الشخصية.",
            ),
            _buildSection(
              context,
              title: "التصفح",
              content: "لم نقم بتصميم هذه المنصة من أجل تجميع بياناتك الشخصية من جهاز الكمبيوتر الخاص بك أو من جوالك أثناء تصفحك للموقع، وإنما سيتم فقط استخدام البيانات المقدمة من قبلك بمعرفتك ومحض إرادتك.",
            ),
            _buildSection(
              context,
              title: "عنوان بروتوكول شبكة الإنترنت (IP)",
              content: "في أي وقت تزور فيه أي موقع إنترنت أو منصة بما فيها هذه المنصة، سيقوم السيرفر المضيف بتسجيل عنوان بروتوكول شبكة الإنترنت (IP) الخاص بك، وتاريخ ووقت الزيارة، ونوع متصفح الإنترنت الذي تستخدمه، والعنوان URL الخاص بأي موقع من مواقع الإنترنت التي تقوم بإحالتك إلى هذا الموقع على الشبكة.",
            ),
            _buildSection(
              context,
              title: "الروابط بالمواقع الأخرى على شبكة الإنترنت",
              content: "قد يشتمل موقعنا على روابط بمواقع أخرى على شبكة الإنترنت. لا نعتبر مسؤولين عن تلك المواقع، ويمكنك الاطلاع على سياسات السرية والمحتويات الخاصة بتلك المواقع التي يتم الدخول إليها من خلال أي رابط ضمن هذا الموقع.",
            ),
            _buildSection(
              context,
              title: "إفشاء المعلومات",
              content: "سنحافظ في كافة الأوقات على خصوصية وسرية كافة البيانات الشخصية التي نتحصل عليها. ولن يتم إفشاء هذه المعلومات إلا إذا كان ذلك مطلوبًا بموجب أي قانون أو عندما نعتقد بحسن نية أن مثل هذا الإجراء سيكون مطلوبًا أو مرغوبًا فيه للتماشي مع القانون، أو للدفاع عن أو حماية حقوق الملكية الخاصة بهذه المنصة أو الجهات المستفيدة منها.",
            ),
            _buildSection(
              context,
              title: "البيانات اللازمة لتنفيذ المعاملات المطلوبة من قبلك",
              content: "عندما نحتاج إلى أية بيانات خاصة بك، فإننا سنطلب منك تقديمها بمحض إرادتك. حيث ستساعدنا هذه المعلومات في الاتصال بك وتنفيذ طلباتك حيثما كان ذلك ممكنًا. لن يتم إطلاقًا بيع البيانات المقدمة من قبلك إلى أي طرف ثالث بغرض تسويقها لمصلحته الخاصة دون الحصول على موافقتك المسبقة والمكتوبة، ما لم يتم ذلك على أساس أنها ضمن بيانات جماعية تُستخدم للأغراض الإحصائية والأبحاث دون اشتمالها على أية بيانات من الممكن استخدامها للتعريف بك.",
            ),
            _buildSection(
              context,
              title: "عند الاتصال بنا",
              content: "سيتم التعامل مع كافة البيانات المقدمة من قبلك على أساس أنها سرية. تتطلب النماذج التي يتم تقديمها مباشرة على الشبكة تقديم البيانات التي ستساعدنا في تحسين موقعنا. سيتم استخدام البيانات التي يتم تقديمها من قبلك في الرد على كافة استفساراتك، ملاحظاتك، أو طلباتك من قبل هذا الموقع أو أي من المواقع التابعة له.",
            ),
            _buildSection(
              context,
              title: "إفشاء المعلومات لأي طرف ثالث",
              content: "لن نقوم ببيع، المتاجرة، تأجير، أو إفشاء أي معلومات لمصلحة طرف ثالث خارج هذه المنصة، أو المنصات والمواقع التابعة لها.",
            ),
            _buildSection(
              context,
              title: "التعديلات على سياسة سرية وخصوصية المعلومات",
              content: "نحتفظ بالحق في تعديل بنود وشروط سياسة سرية وخصوصية المعلومات إن لزم الأمر ومتى كان ذلك مناسبًا. سيتم تنفيذ التعديلات هنا أو على صفحة سياسة الخصوصية الرئيسية، وسنوفر إشعارًا مستمرًا بالبيانات التي حصلنا عليها، وكيف سنستخدمها، والجهة التي سنقوم بتزويدها بهذه البيانات.",
            ),
            _buildSection(
              context,
              title: "الاتصال بنا",
              content: "يمكنكم الاتصال بنا عند الحاجة من خلال الضغط على رابط \"اتصل بنا\" المتوفر في روابط المنصة، أو من خلال الإرسال إلى بريدنا الإلكتروني: info@rowad-harag.com على اسم النطاق أعلاه.",
            ),
            HomeButtonsSelectorFooterWidget()
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, {String? title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (title != null)
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.right,
          ),
        const SizedBox(height: 8),
        Text(
          content,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.black,
            height: 1.6,
          ),
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 16),
      ],
    ).hPadding(0.03.width);
  }
}