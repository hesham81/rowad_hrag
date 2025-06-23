import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';

import '../theme/app_colors.dart';

class CenterTextContainer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CenterTextContainer({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 0.3.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black.withAlpha(80),
        ),
      ),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.add,
                color: AppColors.primaryColor,
              ),
            ),
            0.02.height.hSpace,
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
