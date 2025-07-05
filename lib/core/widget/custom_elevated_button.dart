import 'package:flutter/material.dart';
import '/core/theme/app_colors.dart';

class CustomElevatedButton extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;

  final Function()? onPressed;
  final Color? btnColor;
  final double borderRadius;
  final BorderSide? border;

  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.btnColor,
    this.borderRadius = 12,
    this.padding,
    this.border,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.btnColor ?? AppColors.secondaryColor,
        padding: widget.padding ?? EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        side: widget.border,
      ),
      child: widget.child,
    );
  }
}
