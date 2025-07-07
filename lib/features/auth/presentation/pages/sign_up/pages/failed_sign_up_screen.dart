import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/widget/icon_error.dart';

class FailedSignUpScreen extends StatelessWidget {
  final String error;

  const FailedSignUpScreen({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconError(
          error: error,
        ),
      ],
    ).center;
  }
}
