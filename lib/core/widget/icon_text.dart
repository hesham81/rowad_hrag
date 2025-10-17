import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/extensions/dimensions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';

class IconText extends StatelessWidget {
  final String rate;

  const IconText({
    super.key,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$rate",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
        ),
        Icon(
          Icons.location_on_outlined,
          color: Colors.grey,
        ),
      ],
    );
  }
}
