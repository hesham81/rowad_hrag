import 'package:flutter/material.dart';
import '/core/theme/app_colors.dart';

typedef ValidationFunction = String? Function(String? value);

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final double borderRadius;
  final IconData? suffixIcon;
  final bool isPassword;
  final ValidationFunction? validate;
  final TextEditingController controller;
  final int minLine;
  final int maxLine;
  final TextInputType keyboardType;
  final bool isReadOnly;
  final bool isFilled;

  final Color? fillColor;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.borderRadius = 40,
    this.suffixIcon,
    this.isPassword = false,
    this.validate,
    required this.controller,
    this.minLine = 1,
    this.maxLine = 1,
    this.keyboardType = TextInputType.text,
    this.isReadOnly = false,
    this.isFilled = false,
    this.fillColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return TextFormField(
      readOnly: widget.isReadOnly,
      keyboardType: widget.keyboardType,
      minLines: widget.minLine,
      maxLines: widget.maxLine,
      validator: widget.validate,
      controller: widget.controller,
      cursorColor: AppColors.secondaryColor,
      decoration: InputDecoration(
        filled: widget.isFilled,
        fillColor: widget.fillColor,
        suffixIcon: (widget.isPassword == false)
            ? (widget.suffixIcon == null)
                ? null
                : Icon(widget.suffixIcon)
            : IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(
                  (isVisible)
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
        hintText: widget.hintText,
        prefixIconColor: AppColors.secondaryColor,
        suffixIconColor: AppColors.secondaryColor,
        focusColor: AppColors.secondaryColor,
        iconColor: AppColors.secondaryColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
      style: theme.labelLarge?.copyWith(
            color: AppColors.secondaryColor,
          ) ??
          TextStyle(
            fontSize: 16,
            color: AppColors.secondaryColor,
          ),
      obscureText: (widget.isPassword) ? !isVisible : false,
    );
  }
}
