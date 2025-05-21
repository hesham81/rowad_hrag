import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';

import '../../../../core/theme/app_colors.dart';

class ContactWithSupport extends StatelessWidget {
  const ContactWithSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تواصل مع الدعم",
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
          ],
        ),
      ),
    );
  }
}
