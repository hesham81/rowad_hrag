import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ArrowWidget extends StatefulWidget {
  final Function()? onTap;
  final bool isForward;

  const ArrowWidget({
    super.key,
    this.onTap,
    this.isForward = true,
  });

  @override
  State<ArrowWidget> createState() => _ArrowWidgetState();
}

class _ArrowWidgetState extends State<ArrowWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.widget.onTap ?? () => Navigator.pop(context),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.secondaryColor,
          ),
        ),
        alignment: Alignment.center,
        child: Icon(
          (this.widget.isForward)
              ? Icons.arrow_forward_ios
              : Icons.arrow_back_ios,
          size: 22,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
