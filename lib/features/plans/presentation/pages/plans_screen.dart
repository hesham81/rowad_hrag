import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';
import 'package:rowad_hrag/core/widget/whatsapp_icon_button.dart';
import 'package:rowad_hrag/features/plans/presentation/widget/card_subscription_item.dart';
import '../manager/plans_cubit.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  int? selectedPlan;
  TextEditingController amountController = TextEditingController();

  TextEditingController resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlansCubit, PlansInitialState>(
      builder: (context, state) {
        if (state is PlansLoadedState) {
          return Scaffold(
            floatingActionButton: WhatsappIconButton(),
            appBar: AppBar(
              title: Text(
                "سداد الرسوم و  الاشتراكات",
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        if (selectedPlan == index) {
                          selectedPlan = null;
                          setState(() {});
                          return;
                        }
                        selectedPlan = index;
                        setState(() {});
                      },
                      child: CardSubscriptionItem(
                        isSelected: (selectedPlan == index),
                        plans: state.plans[index],
                      ),
                    ),
                    separatorBuilder: (context, index) => 0.01.height.hSpace,
                    itemCount: state.plans.length,
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
                      hintText: "ادخل المبلغ",
                      controller: amountController,
                      borderColor: Colors.black,
                      keyboardType: TextInputType.number,
                      borderRadius: 0,
                      isReadOnly: (selectedPlan != null) ? true : false,
                      onChange: (p0) => setState(() {
                        if (p0 == null || amountController.text.isEmpty) {
                          resultController.text = "0";
                          return;
                        }
                        double amount = double.parse(p0 ?? "0");
                        double result = amount * 0.01;
                        resultController.text = result.toString();
                      }),
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
                      controller: resultController,
                      borderColor: Colors.black,
                      borderRadius: 0,
                    ),
                  ),
                  0.04.height.hSpace,
                  CustomElevatedButton(
                    btnColor: Color(0xff312F59),
                    padding: EdgeInsets.all(15),
                    onPressed: (selectedPlan != null ||
                            amountController.text.isNotEmpty)
                        ? () async {
                            if (resultController.text.isNotEmpty) {
                              double number =
                                  double.parse(resultController.text);
                              await context
                                  .read<PlansCubit>()
                                  .payCustomAmount(number);
                              return;
                            }
                            int newIndex = selectedPlan! + 1;
                            await context
                                .read<PlansCubit>()
                                .payToPlan(newIndex);
                          }
                        : null,
                    child: Text(
                      "ادفع الآن",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                  // 0.03.height.hSpace
                ],
              ).hPadding(0.03.width),
            ),
          );
        } else if (state is PlansErrorState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "سداد الرسوم و  الاشتراكات",
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 180,
                ),
                Center(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "سداد الرسوم و  الاشتراكات",
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
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
