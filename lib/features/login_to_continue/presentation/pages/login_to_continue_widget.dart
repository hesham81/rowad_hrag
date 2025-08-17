import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';

import '../../../../core/route/route_names.dart';
import '../../../../core/widget/custom_elevated_button.dart';

class LoginToContinueWidget extends StatelessWidget {
  const LoginToContinueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Colors.grey,
          size: 180,
        ),
        0.02.height.hSpace,
        Text(
          "لم تقم بتسجيل الدخول",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        0.01.height.hSpace,
        Text(
          "يرجى تسجيل الدخول للوصول للمحتوى",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        0.02.height.hSpace,
        CustomElevatedButton(
          child: Text(
            "تسجيل الدخول",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          onPressed: () => Navigator.pushNamed(
            context,
            RouteNames.signIn,
          ),
        ),
      ],
    ).hPadding(0.03.width);
  }
}
