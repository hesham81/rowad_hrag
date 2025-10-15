import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';

import '../../../../core/theme/app_colors.dart';

class CustomProfileTabIcon extends StatefulWidget {
  final String text;

  final String imagePath;

  final bool isWithArrow;
  final bool isWhiteColor;

  final Function() onTap;

  const CustomProfileTabIcon({
    this.isWithArrow = true,
    this.isWhiteColor = false,
    super.key,
    required this.text,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<CustomProfileTabIcon> createState() => _CustomProfileTabIconState();
}

class _CustomProfileTabIconState extends State<CustomProfileTabIcon> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: this.widget.onTap,
        child: Row(
          children: [
            Image.asset(
              widget.imagePath,
              width: 24,
              height: 24,
            ),
            0.03.width.vSpace,
            Text(
              widget.text,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: (widget.isWhiteColor)
                        ? AppColors.primaryColor
                        : Colors.black,
                  ),
            ),
            Spacer(),
            (this.widget.isWithArrow) ? ArrowWidget() : SizedBox(),
          ],
        ).allPadding(3),
      ),
    );
  }
}
