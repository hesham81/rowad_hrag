import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';

class Categories extends StatelessWidget {
  final String path;

  final String text;

  const Categories({
    super.key,
    required this.path,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 0.15.height,
          width: 0.35.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondaryColor,
              width: 3,
            ),
          ),
          child: Stack(
            children: [
              // Background SVG Image
              SvgPicture.asset(
                path,
                height: 0.15.height,
                width: 0.35.width,
                fit: BoxFit.cover,
              ),

              // Text Label at the Bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  color: Colors.black.withOpacity(0.7),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
