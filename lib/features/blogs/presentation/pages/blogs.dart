import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/blogs/presentation/manager/blog_cubit.dart';
import 'package:rowad_hrag/features/blogs/presentation/widgets/blog_item.dart';

import '../../domain/entities/blog.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  List<Blog> blogList = [
    Blog(
      id: 1,
      categoryId: 101,
      title: "أهمية الصحة النفسية في بيئة العمل",
      slug: "mental-health-at-work",
      shDescription: "تعرف على كيفية تأثير الصحة النفسية على الإنتاجية.",
      descrption:
          "الصحة النفسية تلعب دورًا كبيرًا في نجاح الفرق والشركات. يتناول هذا المقال أثر الدعم النفسي على الموظفين وتحسين الأداء.",
      banner: 1,
      createdAt: DateTime(2024, 5, 1),
    ),
    Blog(
      id: 2,
      categoryId: 102,
      title: "كيفية بناء عادات يومية صحية",
      slug: "healthy-daily-habits",
      shDescription: "خطوات بسيطة لبناء عادات صحية تدوم مدى الحياة.",
      descrption:
          "في هذا المقال سنعرض لك خطة عملية لدمج العادات الصحية مثل الرياضة والنوم الجيد في روتينك اليومي.",
      banner: 2,
      createdAt: DateTime(2024, 5, 5),
    ),
    Blog(
      id: 3,
      categoryId: 103,
      title: "فوائد المشي اليومي للجسم والعقل",
      slug: "benefits-of-walking",
      shDescription: "اكتشف فوائد المشي لمدة 30 دقيقة يوميًا.",
      descrption:
          "المشي ليس مجرد وسيلة للنقل، بل هو تمرين مفيد جدًا للقلب والصحة النفسية. اقرأ المزيد حول فوائده الشاملة.",
      banner: 3,
      createdAt: DateTime(2024, 5, 10),
    ),
    Blog(
      id: 4,
      categoryId: 104,
      title: "إدارة الوقت بشكل فعال",
      slug: "effective-time-management",
      shDescription: "طرق عملية لتنظيم وقتك واستغلاله أفضل استغلال.",
      descrption:
          "تعرّف على تقنيات مثل مصفوفة أيزنهاور وتقنية بومودورو لتحسين إنتاجيتك اليومية.",
      banner: 4,
      createdAt: DateTime(2024, 5, 12),
    ),
    Blog(
      id: 5,
      categoryId: 105,
      title: "أهمية النوم الجيد للصحة العامة",
      slug: "importance-of-sleep",
      shDescription: "لماذا النوم الكافي ضروري لكل من الجسم والدماغ؟",
      descrption:
          "يشرح هذا المقال كيف يؤثر النوم على الذاكرة، المناعة، والمزاج العام.",
      banner: 5,
      createdAt: DateTime(2024, 5, 14),
    ),
    Blog(
      id: 6,
      categoryId: 106,
      title: "التغذية السليمة وأثرها على الطاقة",
      slug: "nutrition-and-energy",
      shDescription: "ما الأطعمة التي تعطي طاقة طويلة الأمد؟",
      descrption:
          "استمتع بمستوى طاقة متوازن عبر تناول الأطعمة الصحيحة. تعرف على أهمية البروتين، الكربوهيدرات المعقدة، والدهون الجيدة.",
      banner: 6,
      createdAt: DateTime(2024, 5, 18),
    ),
    Blog(
      id: 7,
      categoryId: 107,
      title: "كيف تبدأ مشروعك الصغير بنجاح",
      slug: "starting-a-small-business",
      shDescription: "نصائح عملية لرواد الأعمال الجدد.",
      descrption:
          "من الفكرة إلى التنفيذ — خطوات عملية لبدء مشروع صغير مع إدارة المخاطر والموارد المتاحة.",
      banner: 7,
      createdAt: DateTime(2024, 5, 20),
    ),
    Blog(
      id: 8,
      categoryId: 108,
      title: "التفكير الإيجابي وكيف يؤثر على حياتك",
      slug: "positive-thinking",
      shDescription: "قوة التفكير الإيجابي في تغيير الواقع",
      descrption:
          "يشرح هذا المقال كيف يمكن أن يُحدث التفكير الإيجابي فارقًا في التعامل مع التحديات اليومية.",
      banner: 8,
      createdAt: DateTime(2024, 5, 22),
    ),
    Blog(
      id: 9,
      categoryId: 109,
      title: "السفر كوسيلة لتوسيع الآفاق",
      slug: "traveling-and-personal-growth",
      shDescription: "كيف يساهم السفر في تنمية الشخصية؟",
      descrption:
          "السفر لا يعني فقط الاستجمام، بل هو فرصة لتعلم ثقافات جديدة واكتشاف نفسك من زاوية مختلفة.",
      banner: 9,
      createdAt: DateTime(2024, 5, 25),
    ),
    Blog(
      id: 10,
      categoryId: 110,
      title: "التنمية البشرية وتطوير الذات",
      slug: "self-development",
      shDescription: "كيف تبدأ رحلتك في تطوير مهاراتك الشخصية؟",
      descrption:
          "دليل شامل يساعدك على بدء رحلة تطوير الذات من خلال القراءة، التعلم المستمر، ووضع أهداف واضحة.",
      banner: 10,
      createdAt: DateTime(2024, 5, 28),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المدونات",
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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            0.01.height.hSpace,
            SafeArea(
              child: CupertinoSearchTextField(),
            ),
            0.01.height.hSpace,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => BlogItem(
                blog: blogList[index],
              ),
              separatorBuilder: (context, index) => 0.01.height.hSpace,
              itemCount: blogList.length,
            ),


            0.02.height.hSpace,
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
