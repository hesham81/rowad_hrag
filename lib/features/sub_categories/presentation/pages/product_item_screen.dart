import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/features/plans/presentation/pages/plans_screen.dart';

import '../../../../core/theme/app_colors.dart';

class ProductItemScreen extends StatefulWidget {
  const ProductItemScreen({super.key});

  @override
  State<ProductItemScreen> createState() => _ProductItemScreenState();
}

class _ProductItemScreenState extends State<ProductItemScreen> {
  var images = [
    "https://rowad-harag.com/public/uploads/all/0uSVSxT9RQQn5pW3PqRRIm99HyrnzvSeO013k4vf.jpg",
    "https://rowad-harag.com/public/uploads/all/jfaGGmx24gRpVruqUi7KhnkZ355ULvS6DL7wk8hH.jpg",
    "https://rowad-harag.com/public/uploads/all/bhArJyYcTyZAJMXd7lDRW45eW5Op154N2jI6TrrQ.jpg",
  ];
  var mainImage =
      "https://rowad-harag.com/public/uploads/all/lGQTkx5BNhfoY2llC5kpPKrnEpfqaUPx0VjcBK0U.jpg";
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomElevatedButton(
        child: Text(
          "دفع الرسوم",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.primaryColor,
              ),
        ),
        onPressed: () => slideLeftWidget(
          newPage: PlansScreen(),
          context: context,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "منتج ١",
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: images[selectedIndex],
              width: double.maxFinite,
            ),
            0.01.height.hSpace,
            SizedBox(
              height: 0.15.height,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: CachedNetworkImage(
                        imageUrl: images[index],
                        fit: BoxFit.fill,
                        height: 0.15.height,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => 0.01.width.vSpace,
                itemCount: images.length,
              ),
            ),
            0.01.height.hSpace,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "بي ام دبليو مديل 2015",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                0.01.height.hSpace,
                Text(
                  "المنطقه : تبوك",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                ).alignRight(),
                0.01.height.hSpace,
                Text(
                  "المدينة : تبوك",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                ).alignRight(),
                0.01.height.hSpace,
                Text(
                  "عدد الكيلومترات : 225",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                ).alignRight(),
                0.01.height.hSpace,
                Text(
                  "تم بواسطة : عمر طلال",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                ).alignRight(),
                0.01.height.hSpace,
                Row(
                  children: [
                    Text(
                      "١٠٠٠ ريال",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor),
                    ),
                    Spacer(),
                    Text(
                      "السعر الكلي   ",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                0.01.height.hSpace,
                Divider(),
                0.01.height.hSpace,
                Text(
                  "وصف",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ).alignRight(),
                0.01.height.hSpace,
                Text(
                  """المواصفات العامهلمواصفات :بي ام دبليو الفئة السابعة 730Li 2015
قير اوتماتيك
بنزين
الممشى: 156 ألف كيلو

بي ام دبليو 730 مديل 2015

العداد : 156 الف كم

حاله البدي :
رش كبوت فقط تجميلي باقي البدي وكاله

المواصفات :
730LI
محرك 6 سلندر
وضعيات القايده المتعدده
نفقيشن
فتحه سقف
بصمه
مثبت سرعه
كميرا خلفيه
حساسات
شاشه كبيره
ستاير جانبيه كهرباء
ستاره خلفيه
ذاكره تخزين مقاعد
عداد ديجتال
مقاعد جلد
مدخل CD
مدخل AUX
مدخل USB
اوتو هولد

وباقي المواصفات المعروفه """,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ).alignRight(),
                0.01.height.hSpace,
                Divider(),
                0.01.height.hSpace,
                Text(
                  "تقيمات الإعلان",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ).alignRight(),
                0.01.height.hSpace,
                Text(
                  "لم تكن هناك مراجعات لهذا الإعلان حتى الآن",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withAlpha(80)),
                ),
                0.01.height.hSpace,
                Divider(),
                0.01.height.hSpace,
                Text(
                  "المعلن",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ).alignRight(),
                0.02.height.hSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "هشام آيمن",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    0.05.width.vSpace,
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: CachedNetworkImageProvider(
                        "https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-6/489928976_2045949285915231_1389553330135841803_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=0URqWfqq3xsQ7kNvwH8qtMp&_nc_oc=Adlm2B76jAu9Lf0W1XfmtJblnru-AH-RECU8JyjFbiTq83ofFikAfEts24R5_94h5bY&_nc_zt=23&_nc_ht=scontent.fcai22-1.fna&_nc_gid=8b3KT_VY80wxVrcqLTr_uA&oh=00_AfLV56YIYg4w_ok7F2Rur7VYI0Inn3n7fAOIMDmwa79HfA&oe=68344994",
                      ),
                    ).alignRight(),
                  ],
                ),
                0.03.height.hSpace,
              ],
            ).hPadding(0.03.width).alignRight()
          ],
        ),
      ),
    );
  }
}
