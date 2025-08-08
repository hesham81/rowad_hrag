import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/features/layout/presentation/widget/home_buttons_selector_footer_widget.dart';

class PlansSubscriptions extends StatelessWidget {
  const PlansSubscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "باقات الإشتراك",
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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notice about registration
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.yellow[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "- لعرض أسعار الاشتراكات وترقيه باقتك المجانيه اضغط علي النص\n- ملحوظة - يجب عليك التسجيل في الموقع اولا لعرض اسعار الخطط وسنترك لكم معلومات عنها في الأسفل",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  height: 1.5,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 24),

            // Individual Plans
            _buildPlanCard(
              context,
              title: "اشتراك ٣ شهور أو ربع سنة بمبلغ وقدره (٤٥٠) ريال",
              rank: "برونزية",
              price: "(٤٥٠) ريال",
              benefits: [
                "الإعفاء من دفع النسبة عند البيع أو الشراء (5) مرات مع إمكانية بث عدد (12) إعلانات بدون دفع رسوم",
              ],
            ),
            const SizedBox(height: 16),

            _buildPlanCard(
              context,
              title: "اشتراك ٦ شهور أو نصف سنة بمبلغ وقدره (٧٥٠) ريال",
              rank: "فضية",
              price: "(٧٥٠) ريال",
              benefits: [
                "الإعفاء من دفع النسبة عند البيع أو الشراء (12) مرات مع إمكانية بث عدد (20) إعلانات بدون دفع رسوم",
              ],
            ),
            const SizedBox(height: 16),

            _buildPlanCard(
              context,
              title: "اشتراك ١٢ شهر أو سنة كاملة بمبلغ وقدره (١٢٠٠) ريال",
              rank: "ذهبية",
              price: "(١٢٠٠) ريال",
              benefits: [
                "الإعفاء من دفع النسبة عند البيع أو الشراء (30) مرات مع إمكانية بث عدد (60) إعلانات بدون دفع رسوم",
              ],
            ),

            const SizedBox(height: 32),

            // Section for Family Producers and Handicrafts
            Text(
              "بالنسبة للأسر المنتجة والحرف اليدوية تكون واشتراكاتهم كالتالي:",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 16),

            _buildPlanCard(
              context,
              title: "اشتراك ٣ شهور أو ربع سنة بمبلغ وقدره (٣٠٠) ريال",
              rank: "برونزية",
              price: "(٣٠٠) ريال",
              benefits: [
                "الإعفاء من دفع النسبة عند البيع أو الشراء (5) مرات مع إمكانية بث عدد (12) إعلانات بدون دفع رسوم",
              ],
            ),
            const SizedBox(height: 16),

            _buildPlanCard(
              context,
              title: "اشتراك ٦ شهور أو نصف سنة بمبلغ وقدره (٦٠٠) ريال",
              rank: "فضية",
              price: "(٦٠٠) ريال",
              benefits: [
                "الإعفاء من دفع النسبة عند البيع أو الشراء (12) مرات مع إمكانية بث عدد (26) إعلانات بدون دفع رسوم",
              ],
            ),
            const SizedBox(height: 16),

            _buildPlanCard(
              context,
              title: "اشتراك ١٢ شهر أو سنة كاملة بمبلغ وقدره (١٠٠٠) ريال",
              rank: "ذهبية",
              price: "(١٠٠٠) ريال",
              benefits: [
                "الإعفاء من دفع النسبة عند البيع أو الشراء (30) مرات مع إمكانية بث عدد (60) إعلانات بدون دفع رسوم",
              ],
            ),

            const SizedBox(height: 32),

            // Contact Us Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement contact us logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("تم الضغط على تواصل معنا")),
                    );
                  },
                  icon: Icon(Icons.chat, color: Colors.white),
                  label: Text(
                    "تواصل معنا",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            HomeButtonsSelectorFooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(
      BuildContext context, {
        required String title,
        required String rank,
        required String price,
        required List<String> benefits,
      }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Plan Title
          Text(
            title,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 12),

          // Features Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Benefits Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "المميزات كالتالي:",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "الرتبة : $rank",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...benefits.map((benefit) => Text(
                      benefit,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                      ),
                    )),
                  ],
                ),
              ),

              // Rank Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: _getRankColor(rank),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  rank,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getRankColor(String rank) {
    switch (rank) {
      case "برونزية":
        return Colors.brown;
      case "فضية":
        return Colors.grey;
      case "ذهبية":
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }
}