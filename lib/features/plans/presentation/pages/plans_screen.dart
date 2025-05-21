import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';
import 'package:rowad_hrag/features/plans/presentation/widget/card_subscription_item.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(
          FontAwesomeIcons.whatsapp,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "الخطط",
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
          children: [
            0.01.height.hSpace,
            Text(
              "خطط الاشتراك",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ).alignRight(),
            0.01.height.hSpace,
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CardSubscriptionItem(),
              separatorBuilder: (context, index) => 0.01.height.hSpace,
              itemCount: 3,
            ),
            Divider(),
            0.01.height.hSpace,
            Text(
              "بيع منتجك برسوم 1% فقط في رواد حراج",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ).alignRight(),
            0.04.height.hSpace,
            Text(
              "حساب الرسوم",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            0.02.height.hSpace,
            Text(
              "ادخل المبلغ",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
            SizedBox(
              width: 0.7.width,
              child: CustomTextFormField(
                hintText: "",
                controller: TextEditingController(),
                borderColor: Colors.black,
                borderRadius: 0,
              ),
            ),
            0.03.height.hSpace,
            Text(
              "الرسوم",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
            SizedBox(
              width: 0.3.width,
              child: CustomTextFormField(
                hintText: "",
                isReadOnly: true,
                controller: TextEditingController(),
                borderColor: Colors.black,
                borderRadius: 0,
              ),
            ),
            0.04.height.hSpace,
            CustomElevatedButton(
              btnColor: Color(0xff312F59),
              padding: EdgeInsets.symmetric(horizontal: 0.1.width),
              onPressed: () {},
              child: Text(
                "ادفع الآن",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
            0.03.height.hSpace
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
