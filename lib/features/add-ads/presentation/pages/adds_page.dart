import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_hrag/core/extensions/alignment.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/theme/app_colors.dart';
import 'package:rowad_hrag/core/widget/custom_elevated_button.dart';
import 'package:rowad_hrag/core/widget/custom_text_form_field.dart';

import '../../../auth/data/models/city_data_model.dart';
import '../manager/addAdCubit.dart';

class AddsPage extends StatefulWidget {
  const AddsPage({super.key});

  @override
  State<AddsPage> createState() => _AddsPageState();
}

class _AddsPageState extends State<AddsPage> {
  TextEditingController address = TextEditingController();
  TextEditingController area = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CityDataModel? city;
  String? state;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddAdCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "أضف اعلان جديد ",
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
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/add.jpg",
              ),
              0.01.height.hSpace,
              Text(
                "عنوان الاعلان",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ).rightBottomWidget(),
              0.01.height.hSpace,
              CustomTextFormField(
                hintText: "عنوان الاعلان",
                controller: address,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return "ادخل عنوان الاعلان";
                  }
                },
              ),
              0.01.height.hSpace,
              Text(
                "المنطقه",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ).rightBottomWidget(),
              0.01.height.hSpace,
              CustomDropdown(
                hintText: "المنطقه",
                items: cubit.cities
                    .map(
                      (e) => e.name,
                    )
                    .toList(),
                onChanged: (p0) {
                  setState(() {
                    city = cubit.cities.firstWhere(
                      (element) => element.name == p0,
                    );
                  });
                  cubit.getState(city!.id);
                },
              ),
              0.01.height.hSpace,
              Text(
                "اختر",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ).rightBottomWidget(),
              0.01.height.hSpace,
              CustomDropdown(
                hintText: "اختر",
                items: cubit.states.map((e) => e.name).toList(),
                onChanged: (p0) {},
              ),
              0.01.height.hSpace,
              CustomElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    0.03.width.vSpace,
                    Text(
                      "رفع صوره الاعلان",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              0.01.height.hSpace,
              Text(
                "إظهار الهاتف",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ).rightBottomWidget(),
              0.01.height.hSpace,
              CustomTextFormField(
                hintText: "إظهار الهاتف",
                controller: address,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return "ادخل عنوان الاعلان";
                  }
                },
              ),
              0.01.height.hSpace,
              CustomTextFormField(
                minLine: 5,
                maxLine: 5,
                hintText: "التفاصيل",
                controller: address,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return "ادخل عنوان الاعلان";
                  }
                },
              ),
              0.01.height.hSpace,
              CustomElevatedButton(
                child: Text(
                  "حفظ الاعلان",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
              0.01.height.hSpace,
            ],
          ).hPadding(0.03.width),
        ),
      ),
    );
  }
}
