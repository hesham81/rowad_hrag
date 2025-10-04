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
  final Function(String?)? onChange;
  final TextInputType keyboardType;
  final bool isReadOnly;
  final bool isFilled;
  final Color? borderColor;
  final double? borderWidth;
  final Color? hintColor;

  final Color? fillColor;

  final bool isSuffixIconWhite;

  const CustomTextFormField({
    this.borderColor,
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
    this.onChange,
    this.borderWidth,
    this.isSuffixIconWhite = false,
    this.hintColor,
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
      onChanged: widget.onChange,
      readOnly: widget.isReadOnly,
      keyboardType: widget.keyboardType,
      minLines: widget.minLine,
      maxLines: widget.maxLine,
      validator: widget.validate,
      autocorrect: true,
      cursorErrorColor: Colors.red,
      controller: widget.controller,
      cursorColor: AppColors.darkTeal,
      decoration: InputDecoration(
        filled: widget.isFilled,
        fillColor: widget.fillColor,
        suffixIcon: (widget.isPassword == false)
            ? (widget.suffixIcon == null)
                ? null
                : Icon(
                    widget.suffixIcon,
                  )
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
                  color: (widget.isSuffixIconWhite)
                      ? Colors.white
                      : AppColors.secondaryColor,
                ),
              ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor ?? AppColors.secondaryColor,
        ),
        prefixIconColor: AppColors.secondaryColor,
        suffixIconColor: AppColors.secondaryColor,
        focusColor: AppColors.secondaryColor,
        iconColor: AppColors.secondaryColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.secondaryColor,
            width: widget.borderWidth ?? 1.5,
          ),
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.secondaryColor,
            width: widget.borderWidth ?? 1.5,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.secondaryColor,
            width: widget.borderWidth ?? 1.5,
          ),
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
