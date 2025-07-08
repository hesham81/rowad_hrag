import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';

class IconError extends StatelessWidget {
  final String error;

  const IconError({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
          size: 180,
        ),
        0.01.height.hSpace,
        Text(
          error,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
        ),
      ],
    );
  }
}
